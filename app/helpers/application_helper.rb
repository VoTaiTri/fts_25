module ApplicationHelper
  def full_title page_title = ""
    base_title = "Ruby on Rail Tutorial"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  def gravatar_for user, options = {}
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    gravatar_url += "?s=#{options[:size]}" if options[:size]
    image_tag gravatar_url, alt: user.username, class: "gravatar"
  end
end
