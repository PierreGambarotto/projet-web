class Comment < ActiveRecord::Base
	validates :author,  :presence => true
	belongs_to :post
end
