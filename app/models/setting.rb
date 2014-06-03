class Setting < ActiveRecord::Base
  validates :name,    presence: true
  validates :content, presence: true

  scope :editable, -> { where(editable: true) }

  def title
    name.gsub(/_/, " ").titleize
  end
end
