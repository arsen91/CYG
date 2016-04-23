require 'pry'
class CarsController < ApplicationController
  def index
    @cars = Car.where(user_id: current_user.id)
    if !@cars.any?
      redirect_to new_car_path
    end
  end

  def get_car_journal
    journal = Journal.where(car_id: params[:id])[0]
    if (!journal) 
      journal = Journal.create(car_id: params[:id])
    end
    respond_to do |format|
      format.json { render json: {journal_id: journal.id} }
    end
  end

  def new
    @car = Car.new
  end

  def create
    params = car_params
    params['year'] = params['year'].to_i
    params[:user_id] = current_user.id
    @car = Car.create(params)
    redirect_to cars_path
  end

  def update
  end

  private
    def car_params
        params.require(:car).permit(:make, :color, :fuel, :year)
    end
end
