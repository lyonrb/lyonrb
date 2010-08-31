module ApplicationHelper
  def page_title
     "LyonRb - " + (content_for(:page_title).empty? ? 'Welcome!' : content_for(:page_title))
  end
end
