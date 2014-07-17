module ApplicationHelper
  def license_copy
    first_post_year = Object.const_get(setting(:post_type).classify).first.published_at.year
    years           = Time.now.year

    unless years == first_post_year
      years = "#{first_post_year}&ndash;#{years}"
    end

    "Copyright &copy; #{years} #{setting :author_name}.".html_safe
  end
end
