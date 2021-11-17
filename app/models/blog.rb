class Blog < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: :slugged

	validates_presence_of :title, :body

	belongs_to :topic
	
	def self.special_blogs
		limit(2)
	end
end
