class Status < ActiveRecord::Base
  attr_accessible :content, :in_reply_to, :private
  validates :content, :presence => true
end
