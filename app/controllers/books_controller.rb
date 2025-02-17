class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

      def index
            @books = Book.all
              end

        def show
          @book = Book.includes(:reviews).find(params[:id]) # If `reviews` is an associated model
            @reviews = @book.reviews || [] # Ensure it's not nil
            end

          def new
                @book = Book.new
                  end

            def create
                  @book = Book.new(book_params)

                      if @book.save
                              redirect_to books_path, notice: "Book was successfully added."
                                  else
                                          render :new, alert: "Error adding book."
                                              end
                        end

              def edit
                  end

                def update
                      if @book.update(book_params)
                              redirect_to books_path, notice: "Book was successfully updated."
                                  else
                                          render :edit, alert: "Error updating book."
                                              end
                        end

                  def destroy
                        @book.destroy
                            redirect_to books_path, notice: "Book was successfully deleted."
                              end

                    private

                      def set_book
                            @book = Book.find(params[:id])
                              end

def book_params
    params.require(:book).permit(:title, :author, :published_year, :status)
                                end
end

