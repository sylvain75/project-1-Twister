# == Schema Information
#
# Table name: twists
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Twist < ActiveRecord::Base
  belongs_to :user
  has_many :comments
end
