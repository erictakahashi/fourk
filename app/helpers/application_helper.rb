module ApplicationHelper
  def action_title(title)
    content_for :title, title
    content_tag(:h2, content_tag(:small, title))
  end

  def new_rate(rateable, establishment)
    raw render(:partial => "rates/new_rate", :locals => { :rateable => rateable, :establishment => establishment })
  end
end
