class FinancialOperation < ApplicationRecord
    validates :type, presence: true
    validates :date, presence: true
    validates :value, presence: true
    validates :cpf, presence: true
    validates :card, presence: true
    validates :ocurrence_time, presence: true
    validates :store_owner, presence: true
    validates :store_name, presence: true
end
