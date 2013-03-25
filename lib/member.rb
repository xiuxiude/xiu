def members
  @items.select { |item| item[:kind] == 'member' }
end

def member_avatar(member, options={})
  gravatar_image(member[:email], options)
end

def member_site(member)
  link_to member[:site], member[:site]
end

def member_github(member)
  link_to member[:github], "https://github.com/#{member[:github]}"
end

def member_twitter(member)
  link_to member[:twitter], "https://twitter.com/#{member[:twitter]}"
end

def member_email(member)
  link_to member[:email], "mailto:#{member[:email]}"
end

def member_book(member)
  if member[:douban].present? and book = Douban.books(member[:douban], :status => "reading").first
    link_to book.book.title, book.book.alt
  else
    "暂时没有在读书啦"
  end
end

def member_projects(member)
  if member[:github].present? and projects = Octokit.repositories(member[:github])
    projects.slice(0, 5)
  end
end
