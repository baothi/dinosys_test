class Expense < ActiveRecord::Base
  belongs_to :category
  belongs_to :employee

  validates :description, presence: true, length: { minimum: 2 }
  # validates :tax_amount, presence: true, length: { minimum: 2 }
  # validates :pre_tax_amount, presence: true, length: { minimum: 2 }
  validates :tax_amount, :pre_tax_amount ,presence:true, numericality: {only_float: true}
end
