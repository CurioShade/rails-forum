class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :name, presence: true
    validates :password, presence: true, length: { minimum: 4 }

    enum :access_type, [:standard_access, :admin_access]
end
