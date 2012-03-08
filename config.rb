require 'slim'
# require "redcarpet"

# I'm bloging!
activate :blog
set :blog_permalink, "blog/:year/:title.html"
set :blog_layout, "blog_layout"
# set :blog_layout, "layout"
set :blog_layout_engine, "slim"
set :markdown, :layout_engine => :slim
# set :markdown_engine, :redcarpet

### 
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
# require 'susy'

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

###
# Haml
###

# CodeRay syntax highlighting in Haml
# First: gem install haml-coderay
# require 'haml-coderay'

# CoffeeScript filters in Haml
# First: gem install coffee-filter
# require 'coffee-filter'

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

###
# Page command
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def my_contributions
    {"thumblemonks/riot"=>[{:sha=>"1b90c5e", :date=>"2011-09-13", :subject=>"remove mention of deprecated exists from README", :body=>""}, {:sha=>"7201941", :date=>"2011-09-13", :subject=>"add deprecation warning to exists macro", :body=>""}, {:sha=>"cc99cd9", :date=>"2011-09-03", :subject=>"remove mention of any macro from README", :body=>""}, {:sha=>"9b1510c", :date=>"2011-09-03", :subject=>"add deprecation warning to any macro", :body=>""}, {:sha=>"3877864", :date=>"2011-09-03", :subject=>"remove discussion of not! from README.", :body=>""}, {:sha=>"64bc72f", :date=>"2011-08-22", :subject=>"remove depreciated not! assertion macro", :body=>""}], "rubinius/rubinius"=>[{:sha=>"e804060", :date=>"2011-10-15", :subject=>"update String#squeeze and #squeeze! specs for 19", :body=>"To do this I needed to:\n\n* clarify wording in String#squeeze spec description\n* clarify wording in String#squeeze! spec\n* add spec for String#squeeze! for 1.9\n* add spec for String#squeeze! in 1.8"}, {:sha=>"7acb876", :date=>"2011-10-15", :subject=>"patch String#squeeze for 19", :body=>"String#squeeze should throw an ArgumentError when given a bad range\n(e.g., 'e-b').\n\nSince String#squeeze and String#squeeze! should both throw an\nArgumentError when the range argument is backward, I moved the error\ninto the String#squeeze! method and removed it from the String#squeeze\nmethod (which is defined in terms of the banged method)."}], "davetron5000/methadone"=>[{:sha=>"998ec00", :date=>"2012-01-22", :subject=>"add features to ensure gemspec consistency", :body=>""}, {:sha=>"0cc4b68", :date=>"2012-01-21", :subject=>"update gemspec dependencies due to bundler changes", :body=>"By default, the gemspec block variable is now gem.  Use that to avoid\nbreaking bundler."}]}
  end

  def contribution_entry(hash)
    [hash[:date], hash[:subject], "(#{hash[:sha]})"].join(' ')
  end
end

# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  # activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
  
  # Use relative URLs
  activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
