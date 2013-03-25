require 'nanoc/toolbox'
require 'douban_api'
require 'octokit'
require 'active_support/core_ext/object'


Douban.configure do |config|
  config.client_id = ENV['DOUBAN_API_KEY']
  config.client_secret = ENV['DOUBAN_API_SECRET']
end

def title_of(item)
  return item[:title] if item[:title]
  return item[:name] if item[:name]

  content = item.compiled_content(:snapshot => :pre)
  return $1 if content =~ /<h1[^>]*>(.*)<\/h1>/i

  return item.identifier.split("/").last
end