class Tag < ActiveRecord::Base
  has_many :articles, :through => :article_taggable
  has_many :article_taggables
end
