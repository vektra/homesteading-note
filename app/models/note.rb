class Note < ActiveRecord::Base
  validates :content, presence: true
  default_scope     { order("published_at desc") }

  def public?
    !self.private?
  end

  def to_param
    pieces = []

    pieces << self.class.to_s.downcase.pluralize
    pieces << published_at.year
    pieces << published_at.month.to_s.rjust(2, '0')
    pieces << published_at.day.to_s.rjust(  2, '0')
    pieces << slug

    "/" + pieces.join("/")
  end

  def params
    if published_at.blank?
      {
        year:       Time.now.year,
        month:      Time.now.month.to_s.rjust(2, '0'),
        day:        Time.now.day.to_s.rjust(  2, '0'),
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
      pieces << published_at.month.to_s.rjust(2, '0')
      pieces << published_at.day.to_s.rjust(  2, '0')
      pieces << slug
    end

    "/" + pieces.join("/")
  end

  def name
    content
  end
end
