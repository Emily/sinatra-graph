Sinatra::Graph
==============

Sinatra::Graph is an extension that wraps Scruffy, a SVG charting library, into Sinatra. It's a very simple extension and the code fits on half a page. It's nice when you need a something done in ten minutes that shows statistics or something, but don't want to be bothered configuring respose_types or cherry-picking options.

Based on https://github.com/matth/chart-topper/ , which does the same thing for Gruff.

## Installation

To install this gem, just use the gem command:

    gem install sinatra-graph

To use it in your project, just require it:

    require 'sinatra/graph'

## Creating a Graph

The method 'graph' declares a route for a graph. Define the title on the first method and it will be 'url-fied'. You can optionally define a prefix too.

Inside the block you can call the following methods: all_smiles, area, bar, line and pie. Pass a title and an array (hash if using a pie) as parameters.

Obviously, you can also access params[] and all other Sinatra methods, or other gem methods, so you can easily handle authorization and other stuff. They also respond to before/after blocks and such, since it's just a "get" block underneath it all.

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
