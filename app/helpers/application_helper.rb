module ApplicationHelper
  def action_title(title)
    content_for :title, title
    content_tag(:h2, content_tag(:small, title))
  end
end
