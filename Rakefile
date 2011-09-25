require 'rake'
require 'rspec/core/rake_task'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = "sinatra-graph"
  gem.version = "0.1.3"
  gem.summary = "Wraps Scruffy in Sinatra's DSL to make graphs and charts."
  gem.description = "Wraps Scruffy in Sinatra's DSL to make SVG graphs and charts."
  gem.email = "shferreira@me.com"
  gem.homepage = "http://github.com/shf/sinatra-graph"
  gem.authors = [ "Silvio Henrique Ferreira" ]
  gem.add_dependency "sinatra", ">= 1.0.0"
  gem.add_dependency "scruffy"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rack-test"
  gem.add_development_dependency "rcov"
  gem.add_development_dependency "jeweler"
end
Jeweler::GemcutterTasks.new

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*_spec.rb'
  t.rcov = true
  t.rcov_opts = ['--exclude', 'gems/']
end
