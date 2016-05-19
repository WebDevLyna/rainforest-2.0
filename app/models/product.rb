class Product < ActiveRecord::Base
  # This will prevent users from trying to save undesirable information to the database.
  validates :name, :description, presence: true
  validates :price_in_cents, numericality: {only_integer: true}
end
