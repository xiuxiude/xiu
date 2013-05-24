def projects
  @items.select { |item| item[:kind] == 'project' }
end

def project_logo(member, options={})
  gravatar_image(member[:email], options)
end
