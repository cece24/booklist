class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text
      format.csv do
        render plain: Book.generate_csv(@books)
        # send_data Book.generate_csv(@books), filename: "book_list.csv"
      end
      format.json do
        render json: @books
      end
    end
  end

end
