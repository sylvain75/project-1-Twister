# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :text
#  admin           :boolean          default(FALSE)
#  image           :text
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :twists, dependent: :destroy
  has_many :comments
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :email, :presence => true, :uniqueness => true
end
