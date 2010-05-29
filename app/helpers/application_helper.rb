module ApplicationHelper
  def page_title
     "LyonRb - " + (@content_for_title || 'Welcome!')
  end
end
