class Classified < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    after_initialize :init

    def init
        self.is_verified ||= false
    end
end
