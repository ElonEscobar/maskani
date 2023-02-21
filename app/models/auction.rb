class Auction < ApplicationRecord
    belongs_to :user

    after_initialize :init

    def init
        self.is_valid ||= true
        self.is_verified ||= false
    end
end
