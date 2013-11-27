module ApplicationHelper
  def write_action?
    unless controller_name == "settings"
      action_name =~ /new|edit/
    end
  end

  def editing?
    action_name == "edit"
  end

  def human_readable_date(datetime)
    datetime.strftime("%F")
  end

  def human_readable_time(datetime)
    datetime.strftime("%l:%M%p").downcase
  end

  def small_word_tag(word)
    content_tag(:b, word, class: "small-word small-word-#{word}")
  end

  def logged_in?
    true
    # false
  end

  def autofocus_value
    !editing?
  end

  def post_type
    setting(:post_type)
  end

  def site_title
    title = ""

    if setting(:site_title).blank?
      title << post_type.capitalize.pluralize
    else
      title << setting(:site_title)
    end

    if @page_title
      title << " &mdash; #{@page_title}"
    end

    title.html_safe
  end

  def setting(key)
    Setting.where(key: key).first.content
  end
end
