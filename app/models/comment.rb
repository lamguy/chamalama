class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: :current_user, recipient: :article
  cattr_accessor :current_user

  
  belongs_to :user
  belongs_to :article
  
  has_reputation :votes,
      :source => :user
end
