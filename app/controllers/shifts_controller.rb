class ShiftsController < ApplicationController

  def index
    render json: Shift.all
  end

  def show
    render json: Shift.find(params[:id])
  end

  
end
