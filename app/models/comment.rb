class Comment < ActiveRecord::Base
 belongs_to :conversation
 belongs_to :user
 validates_presence_of :body
 validates_length_of :body, :maximum => 60
end
