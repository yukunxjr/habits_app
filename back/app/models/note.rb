class Note < ApplicationRecord
    belongs_to :user
    has_many :study, dependent: :destroy

    validates :title, presence: true
    validates :body,    length: { maximum: 1000 }

    include Discard::Model
end
