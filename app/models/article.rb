class Article < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  
  belongs_to :user
  has_many :comments
end
