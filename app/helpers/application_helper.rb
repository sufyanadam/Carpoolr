module ApplicationHelper
  def button_link_to(content, url, options = {})
    link_to(content, url, options.reverse_merge("data-role" => "button"))
  end
end
