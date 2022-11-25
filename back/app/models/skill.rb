class Skill < ApplicationRecord

    belongs_to :user
    has_many :studies

    validates :name, presence: true, length: { maximum: 20 }
end
