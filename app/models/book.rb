class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :genre, presence: true
    validates :status, presence: true
    enum status: [:estante, :prestado]
end
