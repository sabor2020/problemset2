class BasicsController < ApplicationController


  def quotations

    if params[:quotation]
      @quotation = Quotation.new(user_params)
      if params[:quotation][:old_cate].present?
        @quotation.category = params[:quotation][:old_cate]
      end
      if @quotation.save
       flash[:notice] = 'Quotation was successfully created.'
       @quotation = Quotation.new
       @cat=Quotation.distinct.pluck(:category)
      end
    else
      @quotation = Quotation.new
      @cat=Quotation.distinct.pluck("category")
    end

    if params[:sort_by] == "date"
      @quotations = Quotation.order(:created_at)
    else
      @quotations = Quotation.order(:category)
    end
    respond_to do |format|
      format.html
      format.json { render json: @quotations }
      format.xml { render 'quotations.xml.builder' }
    end

    if params[:word]!=""
      like_keyword = "%#{params[:word]}%"
      @quotations = Quotation.where("quote LIKE ? OR author_name LIKE ?", like_keyword,like_keyword)
    end
  end

  private
  def user_params
    params.require(:quotation).permit(:author_name,:category, :old_cate, :quote)
  end

end
