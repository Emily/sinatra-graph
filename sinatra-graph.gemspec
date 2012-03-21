# -*- encoding: utf-8 -*-  
$:.push File.expand_path("../lib", __FILE__)
  
Gem::Specification.new do |s|  
  s.name        = "sinatra-graph"  
  s.version     = "0.1.8" 
  s.platform    = Gem::Platform::RUBY  
  s.authors     = ["smf"]  
  s.email       = [""]  
  s.homepage    = ""  
  s.summary     = %q{Sinatra Graph Library}  
  s.description = %q{Scruffy for Sinatra}  
  
  s.add_dependency "scruffy"
  s.add_dependency "sinatra"
  
  s.files         = ["lib/sinatra/graph.rb"]
  s.test_files    = []
  s.require_paths = ["lib"]  
end