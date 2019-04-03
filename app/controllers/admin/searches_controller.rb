class Admin::SearchesController < Admin::BaseController

  def index
    @users = User.search(params[:term]).paginate page: params[:page], per_page: 5
    render "admin/users/index"
  end
end
