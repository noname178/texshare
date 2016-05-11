module MenuHelper
  CONTROLLERS = %w(share search mypage help)
  def menu
    ret = ""
    ret += "<div class='menu-container'>"
    ret += "<ul class='menu'>"
    CONTROLLERS.each do |controller|
      ret += "<li>"
      ret += "<a href='/#{controller}'>"
      ret += "<div class='menu-image-container'>"
      ret += controller == controller_name ? image_tag("icons/current/#{controller}.png") : image_tag("icons/#{controller}.png")
      ret += "</div>"
      ret += controller == controller_name ? "<div class='menu-label current'>" : "<div class='menu-label'>"
      ret += "#{t(controller)}"
      ret += "</div>"
      ret += "</a>"
      ret += "</li>"
    end
    ret += "</ul>"
    ret += "</div>"
    ret = ret.html_safe
  end

  def current_controller?(ret)
  end
end