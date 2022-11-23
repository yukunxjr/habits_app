class Study < ApplicationRecord
    belongs_to :skill

    validates :date, presence: true
    validates :time, presence: true
end
