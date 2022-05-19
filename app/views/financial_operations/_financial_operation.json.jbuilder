json.extract! financial_operation, :id, :type, :date, :value, :cpf, :card, :ocurrence_time, :store_owner, :store_name, :created_at, :updated_at
json.url financial_operation_url(financial_operation, format: :json)
