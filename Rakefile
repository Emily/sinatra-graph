require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = "sinatra-graph"
  gem.version = "0.1.1"
  gem.summary = "Wraps Scruffy in Sinatra's DSL."
  gem.description = "Wraps Scruffy in Sinatra's DSL."
  gem.email = "shferreira@me.com"
  gem.homepage = "http://github.com/shf/sinatra-graph"
  gem.authors = [ "Silvio Henrique Ferreira" ]
  gem.add_dependency "sinatra", ">= 1.0.0"
  gem.add_dependency "scruffy"
  gem.add_development_dependency "rspec"
end
Jeweler::GemcutterTasks.new

RSpec::Core::RakeTask.new(:spec)
