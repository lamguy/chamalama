class Follow < ActiveRecord::Base

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  include PublicActivity::Model
  tracked owner: :current_user, recipient: :user

  # NOTE: Follows belong to the "followable" interface, and also to followers
  belongs_to :followable, :polymorphic => true
  belongs_to :follower,   :polymorphic => true
  
  cattr_accessor :current_user, :user

  def block!
    self.update_attribute(:blocked, true)
  end

end
