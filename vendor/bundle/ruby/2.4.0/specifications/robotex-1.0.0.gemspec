# -*- encoding: utf-8 -*-
# stub: robotex 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "robotex".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Kite".freeze]
  s.date = "2012-01-20"
  s.extra_rdoc_files = ["README.rdoc".freeze]
  s.files = ["README.rdoc".freeze]
  s.homepage = "http://www.github.com/chriskite/robotex".freeze
  s.rdoc_options = ["-m".freeze, "README.rdoc".freeze, "-t".freeze, "Robotex".freeze]
  s.rubygems_version = "2.6.14.3".freeze
  s.summary = "Obey Robots.txt".freeze

  s.installed_by_version = "2.6.14.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9.2"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 3.12"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.8.0"])
      s.add_development_dependency(%q<fakeweb>.freeze, [">= 1.3.0"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0.9.2"])
      s.add_dependency(%q<rdoc>.freeze, [">= 3.12"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.8.0"])
      s.add_dependency(%q<fakeweb>.freeze, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0.9.2"])
    s.add_dependency(%q<rdoc>.freeze, [">= 3.12"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.8.0"])
    s.add_dependency(%q<fakeweb>.freeze, [">= 1.3.0"])
  end
end
