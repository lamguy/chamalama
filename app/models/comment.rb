class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  
  belongs_to :user
  belongs_to :article
end
