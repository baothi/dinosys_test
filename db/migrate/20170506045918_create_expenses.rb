class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :description
      t.string :tax_name
      t.string :tax_amount
      t.string :pre_tax_amount

      t.string :description
      t.references :category, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
