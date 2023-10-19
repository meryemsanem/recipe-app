class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: true
  validates :cooking_time, presence: true, numericality: true
  validates :description, presence: true

  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  def total_price
    recipe_foods.sum { |fd| fd.quantity * fd.food.price }
  end
end
