class Borrowing < ApplicationRecord
    belongs_to :book
      validates :borrower_name, presence: true

        def returned?
              returned_at.present?
                end
end

