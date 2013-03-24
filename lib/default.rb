require "nanoc/toolbox"

def title_of(item)
  return item[:title] if item[:title]

  content = item.compiled_content(:snapshot => :pre)
  return $1 if content =~ /<h1[^>]*>(.*)<\/h1>/i

  return item.identifier.split("/").last
end