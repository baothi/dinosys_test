class Category < ActiveRecord::Base
  has_many :expenses

  validates :name, presence: true, uniqueness: true, length: { in: 4..50 }

end
