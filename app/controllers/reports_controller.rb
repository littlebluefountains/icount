class ReportsController < ApplicationController
  def capacity
  	@tanks = Tank.order("station_id asc")
  	@stations = Station.order("name asc")
  end

  def stock
  	@stocks = Stock.all_stock
  	#@unique_stocks = Stock.recent_stock
  	@unique_stocks = @stocks.uniq
  end

  def sales
  end

  def trends
  end

  def stock_addition
  	@stocks = StockAddition.all_stock_addition
  	@unique_stocks = StockAddition.recent_stock
  	#@unique_stocks = @stocks.uniq
  end

  def stock_deduction
    @deduct_stocks = StockDeduction.all_stock_deduction
    @deduct_unique_stocks = StockDeduction.recent_stock
    #@unique_stocks = @stocks.uniq
  end
end
