class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Shared helpers across all Homesteading publisher apps
  helper HomesteadingHelpers::Engine.helpers


  before_action :require_auth, only: [:new,  :edit, :create, :update, :destroy]

  # temp hack to hide C_UD routes
  def logged_in?
    false
  end

  def require_auth
    unless logged_in?
      return redirect_to(root_path)
    end
  end
end
