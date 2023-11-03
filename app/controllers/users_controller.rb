class UsersController < ApplicationController

  before_action :check_admin, only: [:destroy]

  # Показать всех пользователей
  def index
    # Получаем список всех пользователей
    @users = User.all
  end

  # Показать пользователя по id
  def show
    # Поиск пользователя по заданному ID
    @user = User.find_by(id: params[:id])

    if @user.present?
      # Отображение страницы с информацией о пользователе
      render "show"
    else
      # Отправляем ошибку 404, если пользователь не найден
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  # Форма для создания нового пользователя
  def new
    # Создаем новый экземпляр пользователя с параметрами из сессии
    @user = User.new(session[:user_params])
  end

  # Создание нового пользователя
  def create
    # Создаем нового пользователя на основе параметров из формы
    @user = User.new(user_params)

    if @user.save
      session[:user_params].delete
      # Перенаправляем пользователя на главную страницу с уведомлением
      redirect_to root_path, notice: "Пользователь создан!"
    else
      # Обработка ошибок регистрации пользователя
      handle_registration_errors
      # Перенаправляем пользователя обратно к форме создания пользователя
      redirect_to new_user_path
    end
  end

  # Форма для редактирования
  def edit
    # Открываем форму редактирования текущего пользователя
    @user = User.find(params[:id])
    # Доступ к редактированию видимости только для админов и самого пользователя
    if current_user == @user || current_user.its_admin
      # Оставьте метод редактирования пользователя без изменений
    else
      flash[:alert] = "У вас нет доступа к редактированию видимости этого пользователя."
      redirect_to root_path
    end
  end

  # Обновление информации о пользователе
  def update
    # Получаем текущего пользователя
    @user = current_user

    if @user.update(user_params)
      # Перенаправляем пользователя на страницу профиля с уведомлением
      redirect_to user_path(@user), notice: "Профиль был отредактирован!"
    else
      # Ошибка при обновлении профиля, отображаем форму редактирования с сообщением об ошибке
      flash.now[:alert] = "Не удалось обновить профиль"
      render :edit
    end
  end

  # Удаление пользователя (см. метод destroy)
  def destroy
    # Метод оставлен пустым, так как не содержит дополнительной функциональности.
  end

  private

  # Метод для извлечения параметров из формы
  def user_params
    params.require(:user).permit(:email, :password, :name, :last_name, :age)
  end

  # Обработка ошибок при регистрации пользователя
  def handle_registration_errors
    if @user.errors[:email].include?("is invalid")
      flash[:alert] = "Некорректный формат email"
    elsif @user.errors[:email].include?("has already been taken")
      flash[:alert] = "Пользователь с таким email уже существует."
    else
      flash[:alert] = "Пожалуйста, заполните обязательные данные в форме. Они обозначены *."
    end
    session[:user_params] = user_params
  end
end
