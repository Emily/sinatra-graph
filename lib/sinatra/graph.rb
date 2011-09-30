require 'scruffy'

module Sinatra
  # Sinatra::Graph is an extension that wraps Scruffy into Sinatra for maximum DSL goodness!
  module Graph
    # Those are the graph types that can be called from inside the block as functions.
    GRAPH_TYPES = [:all_smiles, :area, :bar, :line, :pie]

    # Declares a route for a graph. Define the title on the first method and it will be 'url-fied'. You can optionally define a prefix too.
    #
    # Inside the block you can call the following methods: all_smiles, area, bar, line and pie. Pass a title and an array (hash if using a pie) as parameters.
    #
    #   graph "Our Business", :prefix => '/graphs' do
    #     area "Buys", [1,5,2,3,4]
    #     bar "Sales", [5,2,6,2,1]
    #   end
    #
    # This graph will be served on /graphs/our_business.svg
    def graph(title, options = {}, &block)
      prefix = options[:prefix]
      get "#{prefix}/#{filename(title)}.svg" do
        content_type "image/svg+xml"

        graph = Scruffy::Graph.new

        @graph = graph
        GRAPH_TYPES.each do |type|
          instance_eval <<-EVAL
            def #{type}(title, values, options = {}, &block)
              @graph.add :#{type}, title, values, options, block
            end
          EVAL
        end

        instance_eval(&block)
        graph.title = title

        graph.value_formatter = format(options[:format], options[:precision])

        if options[:type].to_s == 'pie'
          graph.renderer = renderer(options[:type])
        else
          Scruffy::Renderers::Standard.new
        end
        graph.render.gsub(/viewBox\=\"([0-9]+)\s100\s([0-9]+)\s200\"/, 'viewBox="0 0 \1 \2"')
      end
    end

    def filename(title)
      title.gsub(/[^a-zA-Z0-9_\s]/, '').gsub(/\s/, '_').downcase
    end

    def format(option, precision = 0)
      case option
        when 'currency': Scruffy::Formatters::Currency.new(:precision => precision || 0)
        when 'percentage': Scruffy::Formatters::Currency.new(:precision => precision || 0)
        else Scruffy::Formatters::Number.new(:precision => precision || 0)
      end
    end

    def renderer(option)
      case option
        when 'pie': Scruffy::Renderers::Pie.new
        else Scruffy::Renderers::Standard.new
      end
    end
  end

  register Graph
end
