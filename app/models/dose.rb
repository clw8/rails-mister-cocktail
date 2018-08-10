class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates_associated :cocktail
  validates_associated :ingredient
  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true
  validates :description, presence: true
  validates_uniqueness_of :ingredient_id, :scope => [:cocktail_id]
end
