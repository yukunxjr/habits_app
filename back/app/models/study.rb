class Study < ApplicationRecord
    belongs_to :skill
    belongs_to :user

    validates :date, presence: true
    validates :skill_id, presence: true
    validates :user_id, presence: true
    validates :time, presence: true
end
