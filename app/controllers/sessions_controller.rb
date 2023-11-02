class SessionsController < ApplicationController

  '''

  БЛОК ДЛЯ СТРАНИЦ

  '''

  #TODO Страница создания
  def new
  end

  '''

    БЛОК ДЛЯ ДЕЙСТВИЙ С БД

  '''

  #TODO Создание сессии
  def create
    user = User.find_by(email: params[:email]) #! Поиск пользователя
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  #! Если есть
      redirect_to root_path, notice: "Вы вошли под именем, #{user.name}"
    else
      flash[:alert] = "Неверные учетные данные. Пожалуйста, попробуйте снова." #! Если нету
      redirect_to new_session_path
    end
  end

  #TODO Удаление сессии
  def destroy
    session.delete(:user_id) #! Удаляем данные сессии
    cookies.delete(:user_id) #! Удаляем куку user_id
    redirect_to root_path, notice: "Вы успешно вышли из системы."
  end
end
