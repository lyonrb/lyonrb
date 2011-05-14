module ApplicationHelper
  def page_title
     "LyonRb - " + (content_for(:page_title).empty? ? 'Welcome!' : content_for(:page_title))
  end
  def handlebars_template_tags
    dir = Rails.root.join('app/assets/javascripts/resources/templates/')
    Dir[dir.join('**/*.*')].map do |path|
      name = path.gsub(dir.to_s, '').sub(File.extname(path), '')
      script = File.read(path).html_safe
      content_tag(:script, script, :name => name, :type => 'text/x-js-template')
    end.join("\n").html_safe
  end
end
