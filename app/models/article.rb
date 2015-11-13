class Article < ActiveRecord::Base
  extend FriendlyId
  include PublicActivity::Model
  tracked owner: :current_user

  friendly_id :title, use: :slugged
  cattr_accessor :current_user, :timeline

  belongs_to :user
  has_many :comments

  has_many :tags, :through => :article_taggable
  has_many :timelines, :through => :timeline_map

  has_many :article_taggables
  has_many :timeline_maps
end
