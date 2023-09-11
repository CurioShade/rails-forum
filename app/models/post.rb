class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  has_many :comments, dependent: :destroy
end
