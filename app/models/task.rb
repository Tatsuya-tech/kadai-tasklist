class Task < ApplicationRecord
    validates :content,presence: true, length: { maximum: 255 }
    validates :detail,presence: true
    validates :status,presence: true, length: { maximum: 10 }
end
