class Subject < ApplicationRecord
    has_many :posts, dependent: :destroy
end
