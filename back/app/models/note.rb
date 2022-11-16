class Note < ApplicationRecord
    belongs_to :user

    validates :title, presence: true
    validates :body,    length: { maximum: 1000 }

    include Discard::Model
end
