class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :name, length: {minimum: 3}, uniqueness: true
end
