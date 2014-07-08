module ApplicationHelper
  def space
    " "
  end

  def index_action?
    action_name == "index"
  end

  def show_action?
    action_name == "show"
  end

  def link_to_syndication(thing)
    html = content_tag(:p, "Also posted to")

    links = []

    external_silos.each do |external|
      if thing.respond_to?(external_silo_url_key(external)) &&
         thing.send(external_silo_url_key(external)) &&
         !thing.send(external_silo_url_key(external)).blank?

         rel = "external "
         rel << "syndication" if show_action?

        links << content_tag(:li, link_to(external, thing.send(external_silo_url_key(external)), rel: rel, class:  "u-syndication"))
      end
    end

    if links.blank?
      space
    else
      html << content_tag(:ul, links.flatten.join.html_safe)
    end
  end

  def external_silos
    %w[
      Facebook
      Foursquare
      Instagram
      Medium
      Tumblr
      Twitter
      Vimeo
      Vine
      WordPress
      YouTube
    ]
  end

  def external_silo_url_key(name)
    "#{name.downcase}_url".to_sym
  end
end
