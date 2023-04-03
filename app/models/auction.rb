class Auction < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    after_initialize :init

    def init
        self.is_valid ||= true
        self.is_verified ||= false
    end
end
