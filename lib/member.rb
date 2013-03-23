def members
  @items.select { |item| item[:kind] == 'member' }
end
