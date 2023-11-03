class PostsController < ApplicationController
  # Метод для отображения списка постов на главной странице
  def index
    # Устанавливаем заголовок страницы
    @page_title = "Главное"
  end
end
