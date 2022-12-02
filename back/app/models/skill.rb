class Skill < ApplicationRecord
    belongs_to :user
    has_many :studies, dependent: :destroy

    validates :name, presence: true, length: { maximum: 20 }, uniqueness: { scope: :user_id }
end
