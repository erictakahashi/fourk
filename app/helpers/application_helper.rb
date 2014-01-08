module ApplicationHelper
  def action_title(title)
    content_for :title, title
    content_tag(:h1, content_tag(:small, title))
  end
end
