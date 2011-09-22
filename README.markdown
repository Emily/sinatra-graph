Sinatra::Graph
==============

Sinatra::Graph is an extension that wraps Scruffy into Sinatra for maximum DSL goodness!

Based on https://github.com/matth/chart-topper/

## Creating a Graph

The method 'graph' declares a route for a graph. Define the title on the first method and it will be 'url-fied'. You can optionally define a prefix too.

Inside the block you can call the following methods: all_smiles, area, bar, line and pie. Pass a title and an array (hash if using a pie) as parameters.

    graph "Our Business", :prefix => '/graphs' do
      area "Buys", [1,5,2,3,4]
      bar "Sales", [5,2,6,2,1]
    end

This graph will be served on /graphs/our_business.svg

## Problems

There is a well known 'bug' in Scruffy that renders SVGs incorrectly in most browsers. We handle this by changing the generated XML instead of monkey-patching or altering the gem.

Because of the syntax sugar, Sinatra::Graph probaby isn't thread safe. If you know how to help me with instance_eval please drop a line!