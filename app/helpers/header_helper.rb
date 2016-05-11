module HeaderHelper

  def back_button
  end

  def search_toggle
    if controller_name == 'search' && action_name == 'index'
      ret = ""
      ret += "<div class='search-toggle'>"
      ret += image_tag("icons/toggle.png")
      ret += "</div>"
      ret = ret.html_safe
    end
  end
end