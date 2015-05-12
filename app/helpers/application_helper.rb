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
  
  def link_to_add_fields label, f, assoc
    new_obj = f.object.class.reflect_on_association(assoc).klass.new
    fields = f.fields_for assoc, new_obj,child_index: "new_#{assoc}" do |builder|
      render "#{assoc.to_s.singularize}_fields", f: builder
    end
    
    link_to label, "#", onclick: "add_fields(this, \"#{assoc}\",
            \"#{escape_javascript(fields)}\")", remote: true
  end
end
