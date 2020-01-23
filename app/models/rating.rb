class Rating < ApplicationRecord
  has_many :recipes, dependent: :destroy

before_save(:titleize_rating)

private
  def titleize_rating
    self.difficulty = self.difficulty.titleize
  end
end
