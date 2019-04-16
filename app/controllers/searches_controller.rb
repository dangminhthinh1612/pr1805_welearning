class SearchesController < ApplicationController

  def index
    if params[:search]
      @title = params[:search][:title].downcase
      @results = Course.by_title @title
      if params[:search][:category_ids].count == 1
        @results
      else
        @results = @results.by_category_ids(params[:search][:category_ids])
      end
      if params[:search][:price_lt].present?
        @results = @results.by_price_lt(params[:search][:price_lt])
      end
      if params[:search][:price_gt].present?
        @results = @results.by_price_lt(params[:search][:price_gt])
      end
    end
  end
end
