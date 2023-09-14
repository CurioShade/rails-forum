class Subject < ApplicationRecord
    has_many :posts, dependent: :destroy

    validates :title, presence: true
    validates :category, presence: true
    validates :description, presence: true
end
