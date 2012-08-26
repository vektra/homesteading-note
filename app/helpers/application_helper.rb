module ApplicationHelper
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
    false
  end
end
