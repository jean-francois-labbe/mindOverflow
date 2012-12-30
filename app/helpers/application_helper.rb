module ApplicationHelper
  def avatar_url(user,size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=identicon&s=#{size}"
  end

  def tab_class(tab_key)
    active = case tab_key
    when :articles then controller.controller_name == "articles"
    when :questions then controller.controller_name == "questions"
    else
      false
    end
    active ? "current" : nil
  end
end
