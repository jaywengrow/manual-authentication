class Api::V1::EmployeesController < ApplicationController

  def show
    @employee = Employee.find_by(id: params[:id])
    if @employee
      render json: @employee
    else
      render json: {message: 'Employee not found'}, status: 404
    end
  end 

  def create
    if @employee = Employee.create(employee_params)
      render json: @employee
    else
      render json: {message: 'Employee not created'}, status: 422
    end
  end 

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :job_title, :email, :office_phone)
  end
end
