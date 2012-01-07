module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /^the landing page$/
      '/'
    when /^the home page$/
      '/'
    when /^the polish landing page$/
      '/pl'
    when /^the english landing page$/
      '/en'
    when /^the admins panel$/
      '/admin'
    when /^the users dashboard$/
      '/en/user/dashboard'
    when /^the auctions page$/
      '/en/auctions'
    when /^the auction "([^\"]+)" edit page$/
      auction = Auction.where(title: $1).last
      "/en/user/auctions/#{auction.id}/edit"
    when /^the user sign in page$/
      '/en/users/sign_in'
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
