class CreateFinancialOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_operations do |t|
      t.integer :type
      t.date :date
      t.float :value
      t.string :cpf
      t.string :card
      t.time :ocurrence_time
      t.string :store_owner
      t.string :store_name

      t.timestamps
    end
  end
end
