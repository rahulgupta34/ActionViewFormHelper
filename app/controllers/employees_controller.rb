class EmployeesController < ApplicationController
  before_action :employee_action, only: [:show, :edit,:update,:destroy]

  def index
    @employees = Employee.all.order(:name)
  end

  def new
    @employee = Employee.new
    @employee.addresses.build
  end

  def create
    @employee = Employee.new(employee_params)
    if !params[:employee][:document].nil?
      @employee.document = params[:employee][:document].original_filename
    end
    if @employee.save
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  
  end

  def edit
    addresses = Employee.find(params[:id])
  end

  def update
    
    @employee.document = params[:employee][:document].original_filename
  
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def search_new
   
   if params[:query].present?
    @employee_search = Employee.where("name LIKE '%#{params[:query]}%'")
    render :search_new
   end
  end

  def employee_action
    @employee = Employee.find(params[:id])
  end

  private
  def employee_params
    params.require(:employee).permit(:name,:email,:password,:birth_date,:gender,:hobbies,:cpp,:address,:mobile,:document,addresses_attributes: [:house_name,:street_name,:road])
  end
end
