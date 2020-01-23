class AddForeignKeyForRecipes < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :recipes, :ratings
  end
end
