class Product < ActiveRecord::Base
  # This will prevent users from trying to save undesirable information to the database.
  validates :name, :description, presence: true
  validates :price_in_cents, numericality: {only_integer: true}

  def formatted_price
    # Convert price_in_cents to "float" divide by 100
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end
end
