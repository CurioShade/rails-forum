class Post < ApplicationRecord
  include RecordLimiter

  belongs_to :user
  belongs_to :subject

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
