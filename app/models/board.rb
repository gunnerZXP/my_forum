class Board < ActiveRecord::Base
	has_many :conversations
	validates_presence_of :title
	validates_length_of :title, :maximum => 20
end
