#!/usr/bin/env ruby
# Automatic namespace generator for organizing documentation by folder structure
# This script creates namespace wrapper files that include the original files
# without modifying the original code.

require 'fileutils'
require 'pathname'

class NamespaceGenerator
  def initialize(base_dir = '.')
    @base_dir = File.expand_path(base_dir)
    @output_dir = File.join(@base_dir, 'doc_wrappers')
    
    # Configurable exclusions - only specify what to exclude
    @excluded_folders = [
      'doc',           # Generated documentation
      'doc_wrappers',  # Generated namespace wrappers
      'lib',           # Library/utility files
      'scratch',       # Temporary/test files
      'assets',        # Static assets (images, etc.)
      '.git',          # Git repository data
      'node_modules',  # Node.js dependencies (if any)
      'vendor',        # Ruby vendor dependencies
      'tmp',           # Temporary files
      'log'            # Log files
    ]
  end

  def generate_wrappers
    puts "Generating namespace wrappers..."
    
    # Clean and create output directory
    FileUtils.rm_rf(@output_dir) if Dir.exist?(@output_dir)
    FileUtils.mkdir_p(@output_dir)
    
    # Discover folders automatically
    discovered_folders = discover_folders_with_ruby_files
    
    # Build markdown content map for embedding in namespace modules
    @markdown_map = build_markdown_map
    
    # Generate a single comprehensive namespace file (after markdown map is ready)
    generate_comprehensive_namespace_file(discovered_folders)
    
    puts "Namespace wrappers generated in #{@output_dir}"
    puts "Discovered #{discovered_folders.length} folders with Ruby files"
    puts "Discovered #{@markdown_map.length} markdown files"
  end

  private

  def discover_folders_with_ruby_files
    folders = {}
    
    # Find all directories that contain Ruby files
    Dir.glob(File.join(@base_dir, '**/*.rb')).each do |ruby_file|
      # Get relative path from base directory
      relative_path = Pathname.new(ruby_file).relative_path_from(Pathname.new(@base_dir)).to_s
      
      # Get the directory containing this Ruby file
      dir_path = File.dirname(relative_path)
      
      # Skip if it's in the root directory or excluded
      next if dir_path == '.' || should_exclude_folder?(dir_path)
      
      # Convert directory path to namespace
      namespace = path_to_namespace(dir_path)
      
      # Store the mapping
      folders[dir_path] = namespace
    end
    
    folders
  end

  def discover_markdown_files
    md_files = []
    
    Dir.glob(File.join(@base_dir, '**/*.md')).each do |md_file|
      relative_path = Pathname.new(md_file).relative_path_from(Pathname.new(@base_dir)).to_s
      dir_path = File.dirname(relative_path)
      
      # Skip root-level .md files (like README.md, CONTRIBUTING.md) and excluded folders
      next if dir_path == '.'
      next if should_exclude_folder?(dir_path)
      
      md_files << relative_path
    end
    
    md_files
  end

  def build_markdown_map
    md_map = {}
    
    discover_markdown_files.each do |relative_path|
      source = File.join(@base_dir, relative_path)
      dir_path = File.dirname(relative_path)
      namespace = path_to_namespace(dir_path)
      
      content = File.read(source)
      # Fix image paths: ![alt](./assets/file.png) -> rdoc-image:assets/file.png
      content = content.gsub(/!\[([^\]]*)\]\(\.?\/?(assets\/[^)]+)\)/, 'rdoc-image:\2')
      
      md_map[namespace] ||= []
      md_map[namespace] << { path: relative_path, content: content }
      puts "Mapped markdown: #{relative_path} -> #{namespace}"
    end
    
    md_map
  end

  def should_exclude_folder?(folder_path)
    # Check if any part of the path matches excluded folders
    path_parts = folder_path.split('/')
    path_parts.any? { |part| @excluded_folders.include?(part) }
  end

  def path_to_namespace(folder_path)
    # Convert folder path to Ruby namespace
    # Example: "popular_algorithms/dynamic_programming" -> "PopularAlgorithms::DynamicProgramming"
    folder_path.split('/').map do |part|
      # Convert snake_case to PascalCase
      part.split('_').map(&:capitalize).join
    end.join('::')
  end

  def generate_wrapper_for_folder(folder_path, namespace)
    full_folder_path = File.join(@base_dir, folder_path)
    return unless Dir.exist?(full_folder_path)

    ruby_files = Dir.glob(File.join(full_folder_path, '*.rb'))  # Only direct files, not nested
    return if ruby_files.empty?

    # Create namespace directory structure
    namespace_dir = File.join(@output_dir, namespace.gsub('::', '/').downcase)
    FileUtils.mkdir_p(namespace_dir)

    # Generate wrapper file for this namespace
    wrapper_file = File.join(namespace_dir, 'namespace_wrapper.rb')
    
    File.open(wrapper_file, 'w') do |f|
      f.puts "# Auto-generated namespace wrapper for #{folder_path}"
      f.puts "# This file wraps original code in proper namespaces for documentation organization"
      f.puts
      
      # Create nested module structure
      modules = namespace.split('::')
      modules.each_with_index do |mod, index|
        f.puts "  " * index + "module #{mod}"
      end
      
      f.puts
      
      # Actually include and wrap the original file content
      ruby_files.each do |file|
        relative_path = file.sub(@base_dir + '/', '')
        f.puts "  " * modules.length + "# === Content from #{relative_path} ==="
        f.puts
        
        # Read and include the actual file content, properly indented
        begin
          file_content = File.read(file)
          # Skip shebang lines and encoding comments
          content_lines = file_content.lines
          content_lines = content_lines.drop_while { |line| line.start_with?('#!') || line.match(/# .*coding/) }
          
          content_lines.each do |line|
            # Add proper indentation for the namespace
            if line.strip.empty?
              f.puts
            else
              f.puts "  " * modules.length + line.rstrip
            end
          end
          f.puts
        rescue => e
          f.puts "  " * modules.length + "# Error reading #{relative_path}: #{e.message}"
        end
      end
      
      # Close modules
      modules.length.times do |i|
        f.puts "  " * (modules.length - 1 - i) + "end"
      end
    end
    
    puts "Generated wrapper for #{namespace} (#{ruby_files.length} files)"
  end

  def generate_comprehensive_namespace_file(discovered_folders)
    # Generate a single file that contains all code properly organized in namespaces
    comprehensive_file = File.join(@output_dir, 'comprehensive_namespaces.rb')
    
    # Organize folders by their root module
    organized_content = {}
    discovered_folders.each do |folder_path, namespace|
      full_folder_path = File.join(@base_dir, folder_path)
      ruby_files = Dir.glob(File.join(full_folder_path, '*.rb'))
      next if ruby_files.empty?
      
      organized_content[namespace] = ruby_files
    end
    
    File.open(comprehensive_file, 'w') do |f|
      f.puts "# Auto-generated comprehensive namespace file"
      f.puts "# This file contains all Ruby code organized in proper namespaces for documentation"
      f.puts
      
      # Group by root modules
      root_modules = {}
      organized_content.each do |namespace, files|
        root = namespace.split('::').first
        root_modules[root] ||= {}
        root_modules[root][namespace] = files
      end
      
      # Generate content for each root module
      root_modules.each do |root_module, namespaces|
        f.puts "# #{root_module} module for organizing #{root_module.downcase} implementations"
        f.puts "module #{root_module}"
        f.puts
        
        # Generate nested modules and their content
        generate_nested_modules(f, namespaces, 1)
        
        f.puts "end"
        f.puts
      end
    end
    
    puts "Generated comprehensive namespace file with all code organized"
  end

  def generate_nested_modules(file, namespaces, indent_level)
    # Group namespaces by their next level
    grouped = {}
    namespaces.each do |full_namespace, files|
      parts = full_namespace.split('::')
      if parts.length > indent_level
        next_level = parts[indent_level]
        remaining = parts[(indent_level + 1)..-1].join('::')
        grouped[next_level] ||= {}
        if remaining.empty?
          grouped[next_level][:files] = files
        else
          grouped[next_level][remaining] = files
        end
      else
        # This is a direct file in this module
        grouped[:direct_files] = files
      end
    end
    
    # Generate content for each group
    grouped.each do |module_name, content|
      next if module_name == :direct_files
      
      indent = "  " * indent_level
      
      # Build the full namespace path for this module to check for markdown docs
      # Extract the parent namespace from the first key in namespaces hash
      sample_key = namespaces.keys.find { |k| k.is_a?(String) }
      if sample_key
        parent_parts = sample_key.split('::')[0...indent_level]
        full_module_namespace = (parent_parts + [module_name]).join('::')
      else
        full_module_namespace = module_name
      end
      
      # Embed any markdown files associated with this module as documentation
      if @markdown_map && @markdown_map[full_module_namespace]
        @markdown_map[full_module_namespace].each do |md_info|
          file.puts "#{indent}# Documentation from #{md_info[:path]}"
          file.puts "#{indent}#"
          md_info[:content].each_line do |line|
            stripped = line.rstrip
            if stripped.empty?
              file.puts "#{indent}#"
            else
              file.puts "#{indent}# #{stripped}"
            end
          end
          file.puts "#{indent}#"
        end
      else
        file.puts "#{indent}# #{module_name} module"
      end
      
      # Generate table of contents for this module
      toc_items = []
      # Collect direct file topics
      if content[:files]
        content[:files].each do |rf|
          toc_items << extract_topic_name(rf)
        end
      end
      # Collect nested sub-module names
      content.each do |key, _|
        next if key == :files || key == :direct_files
        toc_items << key.to_s
      end
      
      if toc_items.any?
        file.puts "#{indent}#"
        file.puts "#{indent}# == Table of Contents"
        toc_items.each do |item|
          file.puts "#{indent}# - #{item}"
        end
        file.puts "#{indent}#"
      end
      
      file.puts "#{indent}module #{module_name}"
      file.puts
      
      # Include files directly in this module
      if content[:files]
        include_files_content(file, content[:files], indent_level + 1)
        content.delete(:files)
      end
      
      # Process nested modules
      unless content.empty?
        generate_nested_modules(file, content, indent_level + 1)
      end
      
      file.puts "#{indent}end"
      file.puts
    end
    
    # Include direct files at this level
    if grouped[:direct_files]
      include_files_content(file, grouped[:direct_files], indent_level)
    end
  end

  def include_files_content(file, ruby_files, indent_level)
    # Treat every file as its own topic/class, passing sibling list for related topics
    ruby_files.each do |ruby_file|
      siblings = ruby_files.reject { |f| f == ruby_file }
      generate_file_as_topic(file, ruby_file, indent_level, siblings)
    end
  end

  def generate_file_as_topic(file, ruby_file, indent_level, siblings = [])
    indent = "  " * indent_level
    
    # Extract topic name from filename
    topic_name = extract_topic_name(ruby_file)
    relative_path = ruby_file.sub(@base_dir + '/', '')
    
    # Read file content to extract leading comments and rdoc-image references
    file_content = File.read(ruby_file) rescue ""
    content_lines = file_content.lines
    content_lines = content_lines.drop_while { |line| line.start_with?('#!') || line.match(/# .*coding/) || line.strip == '# frozen_string_literal: true' }
    
    # Extract leading comments (before any code) and rdoc-image lines for class-level docs
    leading_comments = []
    image_lines = []
    content_lines.each do |line|
      stripped = line.strip
      if stripped.start_with?('#') || stripped.empty?
        leading_comments << line
        if stripped.match?(/rdoc-image:/)
          # Fix image path and collect for class-level doc
          fixed = stripped.gsub(/rdoc-image:[\.\/]*assets\//, 'rdoc-image:assets/')
          fixed = fixed.gsub(/rdoc-image:\.\.\/(assets)/, 'rdoc-image:\1/')
          image_lines << fixed
        end
      else
        break
      end
    end
    
    # Also scan entire file for any rdoc-image references not in leading comments
    content_lines.each do |line|
      stripped = line.strip
      if stripped.match?(/rdoc-image:/) && !leading_comments.include?(line)
        fixed = stripped.gsub(/rdoc-image:[\.\/]*assets\//, 'rdoc-image:assets/')
        fixed = fixed.gsub(/rdoc-image:\.\.\/(assets)/, 'rdoc-image:\1/')
        image_lines << fixed unless image_lines.include?(fixed)
      end
    end
    
    # Write class-level documentation with leading comments and images
    file.puts "#{indent}# #{topic_name} - Individual Topic"
    file.puts "#{indent}# Source: #{relative_path}"
    
    # Include leading comments as class-level documentation
    leading_comments.each do |line|
      stripped = line.strip
      if stripped.empty?
        file.puts "#{indent}#"
      elsif stripped.start_with?('#')
        cleaned = stripped.gsub(/rdoc-image:[\.\/]*assets\//, 'rdoc-image:assets/')
        cleaned = cleaned.gsub(/rdoc-image:\.\.\/(assets)/, 'rdoc-image:\1/')
        file.puts "#{indent}#{cleaned}"
      end
    end
    
    # Add any rdoc-image references found elsewhere in the file
    image_lines.each do |img_line|
      unless leading_comments.any? { |lc| lc.strip.match?(/rdoc-image:/) }
        file.puts "#{indent}#{img_line}"
      end
    end
    
    # Add Related Topics section with links to sibling classes in the same namespace
    if siblings.any?
      file.puts "#{indent}#"
      file.puts "#{indent}# == Related Topics"
      siblings.each do |sibling|
        sibling_name = extract_topic_name(sibling)
        file.puts "#{indent}# - #{sibling_name}"
      end
      file.puts "#{indent}#"
    end
    
    file.puts "#{indent}class #{topic_name}"
    file.puts
    
    include_single_file_content(file, ruby_file, indent_level + 1)
    
    file.puts "#{indent}end"
    file.puts
  end

  def extract_topic_name(ruby_file)
    # Extract topic name from filename and make it a proper class name
    filename = File.basename(ruby_file, '.rb')
    filename.split('_').map(&:capitalize).join('')
  end

  def include_single_file_content(file, ruby_file, indent_level)
    indent = "  " * indent_level
    relative_path = ruby_file.sub(@base_dir + '/', '')
    
    file.puts "#{indent}# === Content from #{relative_path} ==="
    file.puts
    
    begin
      file_content = File.read(ruby_file)
      content_lines = file_content.lines
      content_lines = content_lines.drop_while { |line| line.start_with?('#!') || line.match(/# .*coding/) }
      
      # Convert =begin/=end block comments to # comments since they must be at column 0
      in_block_comment = false
      content_lines.each do |line|
        stripped = line.strip
        
        if stripped == '=begin'
          in_block_comment = true
          next
        elsif stripped == '=end'
          in_block_comment = false
          next
        end
        
        if in_block_comment
          # Convert block comment lines to regular comments
          if stripped.empty?
            file.puts "#{indent}#"
          else
            file.puts "#{indent}# #{stripped}"
          end
        elsif line.strip.empty?
          file.puts
        else
          cleaned_line = line.rstrip
          # Fix rdoc-image paths to point to doc/assets/
          cleaned_line = cleaned_line.gsub(/rdoc-image:[\.\/]*assets\//, 'rdoc-image:assets/')
          cleaned_line = cleaned_line.gsub(/rdoc-image:\.\.\/(assets)/, 'rdoc-image:\1/')
          
          file.puts "#{indent}#{cleaned_line}"
        end
      end
      file.puts
    rescue => e
      file.puts "#{indent}# Error reading #{relative_path}: #{e.message}"
    end
  end
end

# Run the generator if this file is executed directly
if __FILE__ == $0
  generator = NamespaceGenerator.new
  generator.generate_wrappers
end
