class Category < ApplicationRecord
    has_many :subjects

    validates :name, presence: true, uniqueness: {case_sensitive: false}
end
