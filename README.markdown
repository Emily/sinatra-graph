Sinatra::Graph
==============

Sinatra::Graph is an extension that wraps Scruffy into Sinatra for maximum DSL goodness!

Based on https://github.com/matth/chart-topper/

## Creating a Graph

The method 'graph' declares a route for a graph. Define the title on the first method and it will be 'url-fied'. You can optionally define a prefix too.

Inside the block you can call the following methods: all_smiles, area, bar, line and pie. Pass a title and an array (hash if using a pie) as parameters.

Obviously, you can also access params[] and all other Sinatra methods.

    require 'sinatra'
    require 'sinatra/graph'

    graph "Our Business", :prefix => '/graphs' do
      area "Buys", [1,5,2,3,4]
      bar "Sales", [5,2,6,2,1]
    end

This graph will be served on /graphs/our_business.svg

## Pie Charts

Pie charts are a special case: they require a hash instead of a list, and they don't need the grid on the background. To make a pie chart, just use the :type => 'pie' option:

    require 'sinatra'
    require 'sinatra/graph'

    graph "Market Share", :type => 'pie' do
      pie "Share", { "Product one" => 100, "Product Two" => 300 }
    end

## Modular Style

To use this gem on Modular Style apps, you just need to register it:

    class MyApp < Sinatra::Base
      register Sinatra::Graph

      ...
    end

## Problems

There is a well known 'bug' in Scruffy that renders SVGs incorrectly in most browsers. We handle this by changing the generated XML instead of monkey-patching or altering the gem.
