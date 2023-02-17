class User < ApplicationRecord
    has_secure_password

    has_many :properties
    has_many :items
    has_many :classifieds
    has_many :auctions
end
