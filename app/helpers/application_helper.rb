module ApplicationHelper
  def nav_link(name,path)
    classes = "nav-link"
    classes += "active" if current_page?(path)
    link_to name,path, class: classes
  end
end

