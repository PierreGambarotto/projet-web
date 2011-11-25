class Mark < ActiveRecord::Base
		validates :value, :numericality => {:greater_than => 0, :less_than => 6}
		has_many :post_scores
		has_many :posts, :through => :post_scores
end
