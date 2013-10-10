class Note < ActiveRecord::Base
  validates :content, :presence => true

  def public?
    !self.private?
  end

  def to_param
    pieces = []

    pieces << self.class.to_s.downcase.pluralize
    pieces << published_at.year
    pieces << published_at.month
    pieces << published_at.day
    pieces << 1 # TODO nth_of_day
    pieces << slug

    "/" + pieces.join("/")
  end

  def params
    if published_at.blank?
      {
        year:       Time.now.year,
        month:      Time.now.month,
        day:        Time.now.day,
        nth_of_day: 1, # TODO nth_of_day
        slug:       slug
      }
    else
      {
        year:       year,
        month:      month,
        day:        day,
        nth_of_day: 1, # TODO nth_of_day
        slug:       slug
      }
    end
  end

  def path
    pieces = []
    pieces << self.class.to_s.downcase.pluralize

    unless published_at.nil?
      pieces << published_at.year
      pieces << published_at.month
      pieces << published_at.day
      pieces << 1 # TODO nth_of_day
      pieces << slug
    end

    "/" + pieces.join("/")
  end

  def name
    content
  end
end
