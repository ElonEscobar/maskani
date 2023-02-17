class Classified < ApplicationRecord
    after_initialize :init

    def init
        self.is_verified ||= false
    end
end
