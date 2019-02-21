# -*- encoding: utf-8 -*-
# stub: anemone 0.7.2 ruby lib

Gem::Specification.new do |s|
  s.name = "anemone".freeze
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Kite".freeze]
  s.date = "2012-05-30"
  s.executables = ["anemone".freeze]
  s.extra_rdoc_files = ["README.rdoc".freeze]
  s.files = ["README.rdoc".freeze, "bin/anemone".freeze]
  s.homepage = "http://anemone.rubyforge.org".freeze
  s.rdoc_options = ["-m".freeze, "README.rdoc".freeze, "-t".freeze, "Anemone".freeze]
  s.rubyforge_project = "anemone".freeze
  s.rubygems_version = "2.6.14.3".freeze
  s.summary = "Anemone web-spider framework".freeze

  s.installed_by_version = "2.6.14.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.3.0"])
      s.add_runtime_dependency(%q<robotex>.freeze, [">= 1.0.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9.2"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 3.12"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.8.0"])
      s.add_development_dependency(%q<fakeweb>.freeze, [">= 1.3.0"])
      s.add_development_dependency(%q<redis>.freeze, [">= 2.2.0"])
      s.add_development_dependency(%q<mongo>.freeze, [">= 1.3.1"])
      s.add_development_dependency(%q<bson_ext>.freeze, [">= 1.3.1"])
      s.add_development_dependency(%q<tokyocabinet>.freeze, [">= 1.29"])
      s.add_development_dependency(%q<kyotocabinet-ruby>.freeze, [">= 1.27.1"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 1.3.4"])
    else
      s.add_dependency(%q<nokogiri>.freeze, [">= 1.3.0"])
      s.add_dependency(%q<robotex>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0.9.2"])
      s.add_dependency(%q<rdoc>.freeze, [">= 3.12"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.8.0"])
      s.add_dependency(%q<fakeweb>.freeze, [">= 1.3.0"])
      s.add_dependency(%q<redis>.freeze, [">= 2.2.0"])
      s.add_dependency(%q<mongo>.freeze, [">= 1.3.1"])
      s.add_dependency(%q<bson_ext>.freeze, [">= 1.3.1"])
      s.add_dependency(%q<tokyocabinet>.freeze, [">= 1.29"])
      s.add_dependency(%q<kyotocabinet-ruby>.freeze, [">= 1.27.1"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 1.3.4"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, [">= 1.3.0"])
    s.add_dependency(%q<robotex>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0.9.2"])
    s.add_dependency(%q<rdoc>.freeze, [">= 3.12"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.8.0"])
    s.add_dependency(%q<fakeweb>.freeze, [">= 1.3.0"])
    s.add_dependency(%q<redis>.freeze, [">= 2.2.0"])
    s.add_dependency(%q<mongo>.freeze, [">= 1.3.1"])
    s.add_dependency(%q<bson_ext>.freeze, [">= 1.3.1"])
    s.add_dependency(%q<tokyocabinet>.freeze, [">= 1.29"])
    s.add_dependency(%q<kyotocabinet-ruby>.freeze, [">= 1.27.1"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 1.3.4"])
  end
end
