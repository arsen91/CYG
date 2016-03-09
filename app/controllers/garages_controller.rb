class GaragesController < ApplicationController
	before_action :all_garages, only: [:new]
	respond_to :html, :js
	before_filter :authenticate_user!, except: [:search]

	def search
		@found_garages = Garage.search_query(params[:search]).average_cost(params[:average_cost])

		respond_to do |format| 
			format.json {render json: @found_garages}
		end
	end

	def new
		@garage = Garage.new
	end

	def create
		@garage = Garage.create(garage_params)
		redirect_to root_path
	end

	private
		def all_garages
			@garages = Garage.all
		end

	def garage_params
      params.require(:garage).permit(:name, :address, :latitude, :longitude, :average_cost, :start_time, :end_time, :working_days)
    end
end
