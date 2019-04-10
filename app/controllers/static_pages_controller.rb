class StaticPagesController < ApplicationController

  def home
    @popularcourses = Course.popular.limit 3
    @newcourses = Course.newest.paginate(page: params[:page], per_page: 12)
  end

  def help; end

  def about; end

  def contact; end

  def news; end

end
