class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_secure_password

    validates :name, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 4 }

    enum :access_type, [:standard_access, :admin_access]
end
