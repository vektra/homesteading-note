class Note < ActiveRecord::Base
  validates :content, presence: true
  scope     :reversed, -> { order("published_at desc") }

  def public?
    !self.private?
  end

  def to_param
    pieces = []

    pieces << self.class.to_s.downcase.pluralize
    pieces << published_at.year
    pieces << published_at.month
    pieces << published_at.day
    pieces << slug

    "/" + pieces.join("/")
  end

  def params
    if published_at.blank?
      {
        year:       Time.now.year,
        month:      Time.now.month,
        day:        Time.now.day,
        slug:       slug
      }
    else
      {
        year:       year,
        month:      month,
        day:        day,
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
      pieces << slug
    end

    "/" + pieces.join("/")
  end

  def name
    content
  end
end
