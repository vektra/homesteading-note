module ApplicationHelper
  # TODO: do this without #eval ?
  def site_url
    eval "#{setting(:post_type).pluralize}_url"
  end

  def tag_url(tag)
    site_url + "/tags/" + tag.gsub(/ /, "+")
  end
end
