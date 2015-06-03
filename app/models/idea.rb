class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true

  def likes_number
    Like.where("idea_id = #{self.id}").count
  end
end
