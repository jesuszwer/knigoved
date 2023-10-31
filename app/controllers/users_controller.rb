class UsersController < ApplicationController
  '''
    БЛОК ДЛЯ ПРЕДСТАВЛЕНИЙ
  '''
  # Лист пользователей
  def index
    @users = User.all
  end

  # Стриница пользователя
  def show
    @user = User.find_by(id: params[:id])

    if @user.present?
      render "show"
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  # Страница регистрации пользователя
  def new
    @user = User.new(session[:user_params])
  end

  # Страница редактирования пользователя
  def edit

  end

  '''
    БЛОК ДЛЯ ДЕЙСТВИЙ С БД
  '''
  # Создание пользователя
  def create
    @user = User.create(user_params)
    if @user.save
      session.delete(:user_params)
      redirect_to root_path, notice: "Пользователь создан!"
    else
      if @user.errors[:email].include?("is invalid")
        flash[:alert] = "Неккоретный формат email"
      elsif @user.errors[:email].include?("has already been taken")
        flash[:alert] = "Пользователь с таким email уже существует."
      else
        flash[:alert] = "Пожалуйста, заполните обязательные данные в форме. Они обозначены *."
      end
      session[:user_params] = user_params
      redirect_to new_user_path
    end
  end

  # Обновление каких либо данных пользователя
  def update

  end

  # Удаление пользователя
  def destroy

  end

  '''
    БЛОК ПОЛЬЗОВАТЕЛЬСКИХ ДЕЙСТВИИ (МЕТОДОВ)
  '''

  # беруться параментры пользователя, если они нужны
  def user_params
    params.require(:user).permit(:email, :password, :name, :last_name, :age)
  end


end
