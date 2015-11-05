class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: [:finders]
  acts_as_followable
  acts_as_follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :articles

  has_reputation :karma,
      :source => [
          { :reputation => :voting_skill, :weight => 1 }]

  has_reputation :voting_skill,
      :source => { :reputation => :votes, :of => :comments }
end
