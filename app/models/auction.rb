class Auction < ApplicationRecord
    after_initialize :init

    def init
        self.valid ||= true
        self.is_verified ||= false
    end
end
