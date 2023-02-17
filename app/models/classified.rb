class Classified < ApplicationRecord
    belongs_to :user

    after_initialize :init

    def init
        self.is_verified ||= false
    end
end
