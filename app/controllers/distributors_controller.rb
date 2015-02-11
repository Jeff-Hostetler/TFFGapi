class DistributorsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: Distributor.all
  end

  def show
    render json: Distributor.find(params[:id])
  end

  def create
    @distributor = Distributor.new(params.require(:distributor).permit(:name, :address))
    if @distributor.save
      render json: @distributor
    end
  end

  def update
    @distributor = Distributor.find(params[:id])
    if @distributor.update(params.require(:distributor).permit(:name, :address))
      render json: @distributor
    end
  end

  def destroy
    @distributor = Distributor.find(params[:id]).destroy
    render json: @distributor
  end

end
