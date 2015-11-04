class Article < ActiveRecord::Base
  extend FriendlyId
  include PublicActivity::Model
  tracked

  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :comments
end
