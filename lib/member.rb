def avatar(member, options={})
  gravatar_image(member[:email], options)
end

def members
  @items.select { |item| item[:kind] == 'member' }
end
