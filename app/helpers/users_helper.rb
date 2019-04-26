module UsersHelper

  def buy_icon_id user, course
    "item_" + user.id.to_s + "_" + course.id.to_s
  end

  def gravatar_for user, options = { size: 80 }
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.user_name, class: "gravatar"
  end

  def activated_user user
    user.activated ? "activated" : "not_activated"
  end
end
