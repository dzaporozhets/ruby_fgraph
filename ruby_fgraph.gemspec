# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby_fgraph}
  s.version = "0.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dmitriy Zaporozhets"]
  s.date = %q{2010-09-29}
  s.description = %q{Lite gem for iteracting with facebook graph api.}
  s.email = %q{railsonweb@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/ruby_fgraph.rb",
     "lib/ruby_fgraph/connection.rb",
     "nbproject/private/rake-d.txt",
     "nbproject/project.properties",
     "nbproject/project.xml",
     "pkg/fgraph-0.0.1.gem",
     "pkg/ruby_fgraph-0.0.1.gem",
     "pkg/ruby_fgraph-0.0.11.gem",
     "spec/ruby_fgraph/connection_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/randx/Facebook-Graph-Gem}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Lite gem for iteracting with facebook graph api.}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/ruby_fgraph/connection_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth2>, ["~> 0.0.11"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<oauth2>, ["~> 0.0.11"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<oauth2>, ["~> 0.0.11"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

