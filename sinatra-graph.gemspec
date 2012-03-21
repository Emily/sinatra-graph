# -*- encoding: utf-8 -*-  
$:.push File.expand_path("../lib", __FILE__)
  
Gem::Specification.new do |s|  
  s.name        = "lorem"  
  s.version     = "0.1.3" 
  s.platform    = Gem::Platform::RUBY  
  s.authors     = ["TODO: Write your name"]  
  s.email       = ["TODO: Write your email address"]  
  s.homepage    = ""  
  s.summary     = %q{TODO: Write a gem summary}  
  s.description = %q{TODO: Write a gem description}  
  
  s.add_development_dependency "scruffy"
  s.add_development_dependency "sinatra"
  
  s.files         = ["lib/sinatra/graph.rb"]
  s.test_files    = []
  s.require_paths = ["lib"]  
end