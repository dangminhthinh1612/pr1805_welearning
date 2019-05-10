class Admin::DashboardsController< Admin::BaseController
  before_action :load_data

  def index; end

  private

  def load_data
    @load_data_week = (6.days.ago.to_date..Date.today).map { |date| 
      UserCourse.paid.by_date(date).count}.inspect
    @load_days = (6.days.ago.to_date..Date.today).map {|date| 
      date.strftime("%d/%m")}

    @load_categories = Category.all.map { |category| category.tag }
    @load_courses_size = Category.all.map { |category| category.courses.size }
  end
end
