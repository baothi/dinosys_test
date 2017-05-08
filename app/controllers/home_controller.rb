class HomeController < ApplicationController

  def show
    @data = handle_export_data
    respond_to do |f|
      f.json { render json: @data }
      f.html { }
    end
  end

  def total
    @total = {}
    Category.all.each do |cat|
      expenses = cat.expenses

      @total[cat.name] = (expenses.sum(:tax_amount).to_f + expenses.sum(:pre_tax_amount).to_f).to_s(:delimited)
    end

    respond_to do |f|
      f.json { render json: @total }
      f.html { }
    end
  end

  private
    def handle_export_data
      # Slution 2: faster
      fields = [
          "expenses.created_at date",
          "categories.name category_name",
          "employees.name employee_name",
          "employees.address employee_address",
          "expenses.description expense_description",
          "tax_name",
          "tax_amount",
          "pre_tax_amount"
        ]

      result = Expense.select(fields.join(","))
        .joins("JOIN categories ON categories.id = expenses.category_id")
        .joins("JOIN employees ON employees.id = expenses.employee_id")

      result.map{|x| x.slice(:date, :category_name, :employee_name, :employee_address, :expense_description, :tax_name, :tax_amount, :pre_tax_amount) }
    end
end



