class Subject < ApplicationRecord
    belongs_to :category
    has_many :posts, dependent: :destroy

    validates :title, presence: true, uniqueness: {case_sensitive: false}
    validates :category, presence: true
    validates :description, presence: true
end
