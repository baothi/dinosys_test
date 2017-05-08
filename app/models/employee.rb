class Employee < ActiveRecord::Base
  has_many :expense

  validates :name, presence: true, uniqueness: true, length: { in: 4..50 }
  validates :address, presence: true, length: { maximum: 100 }
end
