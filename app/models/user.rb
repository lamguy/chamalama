class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: [:finders]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :articles
end
