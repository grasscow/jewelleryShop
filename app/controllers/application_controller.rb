class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_current_user
  before_action :set_cart

private

  def set_cart #загружать корзину если она существует или создавать новую
    @cart=Cart.find(session[:cart_id])
    @cart_cnt = @cart.line_items.count #sum(:quantity) мы выводим именно количество наименований
  rescue ActiveRecord::RecordNotFound
    @cart=Cart.create
    session[:cart_id]= @cart.id
    @cart_cnt = 0
  end
  def set_current_user
    @current_user=User.find(session[:user_id]) if session[:user_id].present?
  end

  def check_authentication
    unless @current_user
      flash[:danger]="Доступ без авторизации запрещен"
      redirect_to login_path
    end
  end

  def admin_permission
    unless @current_user.try(:admin?)
      flash[:danger]="Недостаточно прав для просмотра страницы"
      redirect_to root_path
    end
  end

end
