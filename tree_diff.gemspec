# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tree_diff}
  s.version = "1.0.0.20090329202825"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Patterson"]
  s.date = %q{2009-03-29}
  s.default_executable = %q{tree_diff}
  s.description = %q{Parse HTML using different parsers, then show the differences between the generated trees.}
  s.email = ["aaronp@rubyforge.org"]
  s.executables = ["tree_diff"]
  s.extra_rdoc_files = ["Manifest.txt", "CHANGELOG.rdoc", "README.rdoc"]
  s.files = [".autotest", "CHANGELOG.rdoc", "Manifest.txt", "README.rdoc", "Rakefile", "bin/tree_diff", "lib/tree_diff.rb", "lib/tree_diff/dot_visitor.rb", "lib/tree_diff/hpricot.rb", "lib/tree_diff/narf.rb", "lib/tree_diff/node.rb", "lib/tree_diff/nokogiri.rb", "lib/tree_diff/rexml.rb", "lib/tree_diff/unify.rb", "test/test_dots.rb", "test/test_merge.rb", "test/test_tree_diff.rb", "tree_diff.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/tenderlove/tree_diff}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{tree_diff}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Parse HTML using different parsers, then show the differences between the generated trees.}
  s.test_files = ["test/test_dots.rb", "test/test_merge.rb", "test/test_tree_diff.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.2.3"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
      s.add_runtime_dependency(%q<narf>, [">= 0"])
      s.add_development_dependency(%q<hoe>, [">= 1.11.0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.2.3"])
      s.add_dependency(%q<hpricot>, [">= 0"])
      s.add_dependency(%q<narf>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 1.11.0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.2.3"])
    s.add_dependency(%q<hpricot>, [">= 0"])
    s.add_dependency(%q<narf>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 1.11.0"])
  end
end
