class Status < ActiveRecord::Base
  attr_accessible :content, :in_reply_to, :private
end
