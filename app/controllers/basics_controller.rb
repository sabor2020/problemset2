class BasicsController < ApplicationController

  def quotations
    if params[:quotation]
      @quotation = Quotation.new(user_params)
      if @quotation.save
        flash[:notice] = 'Quotation was successfully created.'
        @quotation = Quotation.new
        @cat=Quotation.distinct.pluck(:category)
      end
    else
      @quotation = Quotation.new
      @cat=Quotation.distinct.pluck(:category)
    end
    if params[:sort_by] == "date"
      @quotations = Quotation.order(:created_at)
    else
      @quotations = Quotation.order(:category)
    end
  end

  private
  def user_params
    params.require(:quotation).permit(:author_name, :category, :quote)
  end
end