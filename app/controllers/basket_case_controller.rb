class BasketCaseController < ApplicationController
  before_action :set_fruits
  before_action :set_items, :set_order

  def index; end

  def order_by_fruit
    @list_items = @list_items.sort
    @list_items = @list_items.reverse if params[:order].present? && params[:order] == "desc" 
    render 'basket_case/index'
  end

  def order_by_amount
    @list_items = @list_items.sort_by(&:last)
    @list_items = @list_items.reverse if params[:order].present? && params[:order] == "desc"

    render 'basket_case/index'
  end

  private
    def set_fruits
      @fruits = {
        oranges: 5,
        apples: 9,
        grapes: 3,
        watermelons: 2,
        guavas: 4
      }
    end

    def set_items
      @list_items = @fruits
    end

    def set_order
      if params[:order].present? && params[:order] == "asc"
        @order = "desc" 
      else 
        @order = "asc" 
      end
    end
end
