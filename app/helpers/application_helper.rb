module ApplicationHelper
  def license_text
    output = []

    # license
    license = License.find(setting(:license))

    if license.name == "All Rights Reserved"
      # Default
      output << "#{license.name} #{license.short_code}"
    else
      # Creative Commons and Public Domain (CC0)
      output << link_to("#{license.name} (#{license.short_code})", license.url, rel: "license")
    end


    # range of years
    years_range = Time.now.year

    first_post      = Object.const_get(setting(:post_type).classify).last
    first_post_year = first_post.nil? ? years_range : first_post.published_at.year

    if first_post_year == years_range
      output << years_range
    else
      output << "#{first_post_year}&ndash;#{years_range}"
    end


    # author's name
    output << setting(:author_name)

    output.join(" ").html_safe
  end
end
