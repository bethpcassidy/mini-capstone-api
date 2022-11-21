class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  validates :id, uniqueness: true
  validates :price, numericality: { greater_than: 0 }

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def tax
    0.09 * price
  end

  def total
    price + tax
  end
end
