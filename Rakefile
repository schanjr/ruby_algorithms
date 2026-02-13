require 'rdoc/task'
require 'pry'
require 'rake'

task :get_readme do
  Dir['**/*'].select {|x| x =~ /_.*(md)/ }.sort
end

task :list_readme do
  puts Dir['**/*'].select {|x| x =~ /_.*(md)/ }.sort
end

task :get_assets do
  rex = /_.*(png|gif|jpg|jpeg|svg)/
  assets = Dir['**/**/**'].select {|x| x =~ rex }.sort
  assets -= Dir['doc/**/**'].select {|x| x =~ rex }.sort
  assets
end

task :doc do
  rm_rf('doc') if Dir.exist?('doc')
  
  # Generate namespace wrappers for organized documentation
  puts "Generating namespace wrappers for folder-based organization..."
  sh "ruby lib/namespace_generator.rb"
  
  # Use direct RDoc command (we know this works from our test)
  puts "Generating documentation with proper namespace organization..."
  # Markdown content is now embedded in the comprehensive namespace file at the module level
  sh "rdoc --format=aliki --title='Ruby Algorithms Documentation' --main=README.md --op=doc --line-numbers --show-hash doc_wrappers/comprehensive_namespaces.rb README.md"
  
  cp_r('assets', 'doc/assets') if Dir.exist?('assets')
  assets = Rake::Task["get_assets"].invoke.first.call
  assets.each do |files|
    cp_r(files, "doc/assets/") if File.exist?(files)
  end
  
  # Copy assets into every nested doc subdirectory so rdoc-image relative paths resolve
  Dir.glob('doc/**/').each do |subdir|
    next if subdir == 'doc/' || subdir.include?('doc/assets')
    target = File.join(subdir, 'assets')
    unless Dir.exist?(target)
      cp_r('doc/assets', target)
    end
  end
end

task :open do
  Rake::Task["open"].invoke
  sh " open doc/index.html "
end

