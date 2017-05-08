json.extract! expense, :id, :description, :category_id, :employee_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
