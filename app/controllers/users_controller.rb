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
    @user = User.new
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
      redirect_to root_path, notice: "User created!"
    else
      render controller: "registrations", action: "new"
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
