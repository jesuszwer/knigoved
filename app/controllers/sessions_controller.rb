class SessionsController < ApplicationController

  # Отображение страницы входа
  def new
  end

  # Обработка попытки входа
  def create
    # Поиск пользователя по адресу электронной почты
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Если пользователь существует и пароль верен, устанавливаем идентификатор пользователя в сессии
      session[:user_id] = user.id
      # Перенаправляем пользователя на главную страницу с уведомлением о успешном входе
      redirect_to root_path, notice: "Вы вошли под именем, #{user.name}"
    else
      # В случае неверных учетных данных, устанавливаем сообщение об ошибке и перенаправляем на страницу входа
      flash[:alert] = "Неверные учетные данные. Пожалуйста, попробуйте снова."
      redirect_to new_session_path
    end
  end

  # Выход пользователя из системы
  def destroy
    # Удаляем идентификатор пользователя из сессии
    session.delete(:user_id)
    # Удаляем куку user_id
    cookies.delete(:user_id)
    # Перенаправляем пользователя на главную страницу с уведомлением о успешном выходе из системы
    redirect_to root_path, notice: "Вы успешно вышли из системы."
  end
end
