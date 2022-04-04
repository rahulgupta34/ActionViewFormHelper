class SimformsController < ApplicationController

    def index
        @simforms = Simform.all
    end

    def new
        @simform = Simform.new
        @simform.build_city
    end
    
    def create
        @simform = Simform.new(simform_params)
        if @simform.save
           redirect_to root_path
        else
         render :new, status: :unprocessable_entity
        end
    end

    def edit
        @simform = Simform.find(params[:id])
    end

    def update
        @simform = Simform.find(params[:id])
        if @simform.update(simform_params)
           redirect_to root_path
        else
           render :edit
        end
    end

    private
    def simform_params
        params.require(:simform).permit(:name, :title, :email, :password, :age, :join, :description, :date_of_joining, city_attributes: [:id,:name])
    end
end
