class SearchesController < ApplicationController

  def index
    if params[:search]
      @title = params[:search][:title].downcase
      if params[:search][:category_ids].count == 1
        @results = Course.by_title @title
      else
        @results = Course.by_title(@title).by_category_ids(params[:search][:category_ids])
      end
    end
  end
end
