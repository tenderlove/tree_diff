# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'rubygems'
$: << File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
require 'tree_diff'

HOE = Hoe.new('tree_diff', TreeDiff::VERSION) do |p|
  p.developer('Aaron Patterson', 'aaronp@rubyforge.org')
  p.extra_deps      = [
    ['nokogiri', '>= 1.2.3'],
    ['hpricot'],
    ['narf'],
  ]
  p.readme_file   = 'README.rdoc'
  p.history_file  = 'CHANGELOG.rdoc'
  p.extra_rdoc_files  = FileList['*.rdoc']
end

namespace :gem do
  desc 'Generate a gem spec'
  task :spec do
    File.open("#{HOE.name}.gemspec", 'w') do |f|
      HOE.spec.version = "#{HOE.version}.#{Time.now.strftime("%Y%m%d%H%M%S")}"
      f.write(HOE.spec.to_ruby)
    end
  end
end

# vim: syntax=Ruby
