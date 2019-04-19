class Admin::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  layout "admin"

  before_action :verify_admin

end
