class Timeline < ActiveRecord::Base
  include PublicActivity::Model
  
  acts_as_followable
  
  cattr_accessor :current_user
  has_many :articles, :through => :timeline_map
  has_many :timeline_maps

end
