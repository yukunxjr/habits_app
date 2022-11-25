class Study < ApplicationRecord
    belongs_to :skill
    belongs_to :user

    validates :date, presence: true
    validates :time, presence: true
end
