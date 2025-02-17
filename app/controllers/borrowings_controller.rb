class BorrowingsController < ApplicationController
    before_action :set_book, only: [:borrow, :return_book, :borrower_history]

      def borrow
            @borrowing = @book.borrowings.new(borrower_name: params[:borrower_name], borrowed_at: Time.current)

                if @borrowing.save
                        @book.update(status: "Borrowed")
                              redirect_to books_path, notice: "Book successfully borrowed by #{@borrowing.borrower_name}."
                                  else
                                          redirect_to books_path, alert: "Failed to borrow the book."
                                              end
                  end

        def return_book
              @borrowing = @book.borrowings.where(returned_at: nil).last

                  if @borrowing
                          @borrowing.update(returned_at: Time.current)
                                @book.update(status: "Available")
                                      redirect_to books_path, notice: "Book successfully returned."
                                          else
                                                  redirect_to books_path, alert: "No active borrowing found."
                                                      end
                    end

          def borrower_history
                @borrowings = @book.borrowings.order(borrowed_at: :desc)
                  end

            private

              def set_book
                    @book = Book.find(params[:book_id])
                      end
end

