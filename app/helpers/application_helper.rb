module ApplicationHelper
  def sanitize_filter(text)
    sanitize text,
             tags: %w(b i strong em s a br img),
             attributes: %w(href src)
  end
end
