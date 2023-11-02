class UsersController < ApplicationController
  '''

    БЛОК ДЛЯ СТРАНИЦ

  '''
  #TODO Лист пользователей
  def index
    @users = User.all
  end

  #TODO Стриница пользователя
  def show
    @user = User.find_by(id: params[:id])

    if @user.present?
      render "show"
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end

  #TODO Страница регистрации пользователя
  def new
    @user = User.new(session[:user_params])
  end

  #TODO Страница редактирования пользователя
  def edit
    @user = current_user
  end

  '''

    БЛОК ДЛЯ ДЕЙСТВИЙ С БД

  '''
  #TODO Создание пользователя
  #! Нужно доделать чтоб при отправки submit не редиректорила новую страницу а выводил флеш с ошибкой
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_params].delete
      redirect_to root_path, notice: "Пользователь создан!"
    else
      handle_registration_errors
      redirect_to new_user_path
    end
  end

  #TODO Обновление каких либо данных пользователя
  #!! ДОДЕЛАТЬ НАДО (потом)
  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(user), notice: "Профиль бы отредактирован!"
    else
      flash.now[:alert] = "Не удалось обновить профиль"
      render :edit # этот способ не работает
    end
  end

  #TODO Удаление пользователя
  def destroy

  end

  '''

    БЛОК ПОЛЬЗОВАТЕЛЬСКИХ ДЕЙСТВИИ (МЕТОДОВ)

  '''

  private

  #TODO беруться параментры пользователя, если они нужны
  def user_params
    params.require(:user).permit(:email, :password, :name, :last_name, :age)
  end

  #TODO Обработчик ошибок
  #! Нужно доделать обработку ошибок и то что нахоидться на 39 строчке
  def handle_registration_errors
    if @user.errors[:email].include?("is invalid") #! Если почта введена не корректная
      flash[:alert] = "Некорректный формат email"
    elsif @user.errors[:email].include?("has already been taken") #! Если почта уже существует и зарегестрированна
      flash[:alert] = "Пользователь с таким email уже существует."
    else #! Другие ошибки
      flash[:alert] = "Пожалуйста, заполните обязательные данные в форме. Они обозначены *."
    end
    session[:user_params] = user_params
  end

end
