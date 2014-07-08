class Note < ActiveRecord::Base
  default_scope { order("published_at desc") }

  validates :content, presence: true
  validates :published_at, :year, :month, :day, :hour, :minute, :second, :slug,
            presence:true, unless: :new_record?

  before_create :set_published_at_attrs, :set_slug
  before_update :set_published_at_attrs, :set_slug

  def path
    klass = self.class.to_s.downcase.pluralize
    "/" + [klass, year, month, day, slug].compact.join("/")
  end

  def params
    { year: year, month: month, day: day, slug: slug }
  end

  def public?
    !self.private?
  end

  def name
    content
  end

  private

  def set_published_at_attrs
    self.published_at ||= Time.zone.now
    self.year   = published_at.year
    self.month  = published_at.month.to_s.rjust(2, "0")
    self.day    = published_at.day.to_s.rjust(  2, "0")
    self.hour   = published_at.hour
    self.minute = published_at.min
    self.second = published_at.sec
  end

  def set_slug
    blank       = ""
    separator   = "-"
    self.slug ||= "#{content}"
    self.slug   = slug.downcase.
      gsub(/\(|\)|\[|\]\./, blank).
      gsub(/&amp;/,         blank).
      gsub(/\W+/,            separator).
      gsub(/_+/,            separator).
      gsub(/ +/,            separator).
      gsub(/-+/,            separator).
      gsub(/^-+/,           blank).
      gsub(/-+$/,           blank)
  end
end
