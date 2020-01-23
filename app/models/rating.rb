class Rating < ApplicationRecord
  has_many :recipes, dependent: :destroy
  scope :most_recipes, -> {(
  select("ratings.id, ratings.difficulty, count(recipes.id) as recipes_count")
  .joins(:recipes)
  .group("ratings.id")
  .order("recipes_count DESC")
  .limit(1)
  )}

before_save(:titleize_rating)

private
  def titleize_rating
    self.difficulty = self.difficulty.titleize
  end
end
