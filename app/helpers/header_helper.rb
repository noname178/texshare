module HeaderHelper

  def back_button
    if action_name != 'index'
      ret = ""
      ret += "<div class='back_button'>"
      ret += "<span class='needsclick' onclick='history.back();'>＜</span>"
      ret += "</div>"
      ret = ret.html_safe
    end
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