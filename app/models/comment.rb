class Comment < ApplicationRecord
  include RecordLimiter

  belongs_to :user

  validates :body, presence: true
end
