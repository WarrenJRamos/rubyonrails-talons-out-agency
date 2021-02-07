class Service < ApplicationRecord
  validates :service_type, length: { maximum: 100 }, presence: true
  validates :description, length: { maximum: 140 }, presence: true
  validates :price, length: { maximum: 20 }, presence: true
end
