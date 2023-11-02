class BooksController < ApplicationController
  def index

  end
  def new
    @book = Book.new()
  end
  def create
    @book = Book.new()

    if @book.save

    end
  end
  def edit

  end
  def update

  end
  def show

  end
  def destroy

  end
end
