class EmployeesController < ApplicationController

  def index
    render json: Employee.all, except: [:shifts]
  end

  def show
    render json: Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(params.require(:employee).permit(:first_name, :last_name, :email, :phone_number, :position))
    @employee.save
    render json: @employee
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(params.require(:employee).permit(:first_name, :last_name, :email, :phone_number, :position))
    render json: @employee
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.delete
    render json: @employee
  end

end
