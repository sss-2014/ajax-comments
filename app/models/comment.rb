class Comment < ActiveRecord::Base
  validates_presence_of :author, :body
end
