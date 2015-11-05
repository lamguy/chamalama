class Tag < ActiveRecord::Base
  acts_as_followable
  
  has_many :articles, :through => :article_taggable
  has_many :article_taggables
end
