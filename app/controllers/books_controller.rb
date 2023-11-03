class BooksController < ApplicationController

  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

  # Отображение списка всех книг
  def index
    @books = Book.all
  end

  # Отображение формы для создания новой книги
  def new
    @book = Book.new()
  end

  # Создание новой книги
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: "Книга добавлена"
    else
      handle_adding_errors
      redirect_to new_book_path
    end
  end

  # Отображение формы редактирования книги
  def edit
    # Добавьте код для отображения формы редактирования книги
  end

  # Обновление информации о книге
  def update
    # Добавьте код для обновления информации о книге
  end

  # Отображение информации о книге по ее ID
  def show
    @book = Book.find_by(id: params[:id])

    if @book.present?
      render "show"
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  # Удаление книги
  def destroy
    # Добавьте код для удаления книги
  end

  # Приватный метод для извлечения параметров книги из формы
  private

  def book_params
    params.require(:book).permit(:title, :description, :author, :year, :genre)
  end

  # Приватный метод для обработки ошибок при создании книги
  def handle_adding_errors
    # Добавьте код для обработки ошибок при создании книги
  end
end
