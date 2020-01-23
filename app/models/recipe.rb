class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  belongs_to :rating

  scope :search, -> (title) {where("title like ?", "%#{title}%")}

  before_save(:titleize_recipe)

  private
  def titleize_recipe
    self.title = self.title.titleize
  end
end
