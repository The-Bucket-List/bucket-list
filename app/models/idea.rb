class Idea < ActiveRecord::Base

  validates :name, length: {minimum: 3}, uniqueness: true
end
