class VendorsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: Vendor.all
  end

  def show
    render json: Vendor.find(params[:id])
  end

  def create
    @vendor = Vendor.new(params.require(:vendor).permit(:name, :address))
    @vendor.save
    render json: @vendor
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(params.require(:vendor).permit(:name, :address))
    render json: @vendor
  end

  def destroy
    @vendor = Vendor.find(params[:id]).destroy
    render json: @vendor
  end

end
