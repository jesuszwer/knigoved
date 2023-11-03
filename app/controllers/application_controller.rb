class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :check_admin, unless: :root_path?

  # Метод для определения текущего пользователя
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  private

  # Метод для проверки, является ли пользователь администратором
  def check_admin
    unless current_user && current_user.its_admin
      flash[:alert] = "У вас нет доступа к этой странице."
      redirect_back(fallback_location: root_path)
    end
  end

  # Метод для требования входа в систему
  def require_login
    unless current_user
      # Пользователь не вошел в систему, выполните необходимые действия, например, перенаправьте его на страницу входа
    end
  end

  # Метод для определения, находится ли пользователь на главной странице
  def root_path?
    request.fullpath == root_path
  end
end
