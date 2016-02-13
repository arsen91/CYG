class GaragesController < ApplicationController
	before_action :all_garages, only: [:new, :search]
	respond_to :html, :js
	before_filter :authenticate_user!

	def search
	end

	def new
		@garage = Garage.new
	end

	def create
		@garage = Garage.create(garage_params)
	end

	private
		def all_garages
			@garages = Garage.all
		end

		def garage_params
      params.require(:garage).permit(:name, :address, :latitude, :longitude, :average_cost)
    end
end