class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  
  validates :product, :user, :presence => true
  validates :description, :presence => true
  validates_inclusion_of :rating, in: 1..5
end
