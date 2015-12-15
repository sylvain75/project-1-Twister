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
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
end
