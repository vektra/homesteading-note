module ApplicationHelper
  def license_text
    output = []

    first_post      = Object.const_get(setting(:post_type).classify).first
    first_post_year = first_post.published_at.year

    years = Time.now.year
    if Time.now.year == first_post_year
      years = Time.now.year
    else
      years = "#{first_post_year}&ndash;#{Time.now.year}"
    end

    license = License.find(setting(:license))

    if license.name == "All Rights Reserved"
      # Default
      output << "#{license.name} #{license.short_code}"
    else
      # Creative Commons and Public Domain (CC0)
      output << link_to("#{license.name} (#{license.short_code})", license.url, rel: "license")
    end

    output << years
    output << setting(:author_name)

    output.join(" ").html_safe
  end
end
