require 'pry'
class GaragesController < ApplicationController
	before_action :all_garages, only: [:new, :search, :create]
	respond_to :html, :js
	before_filter :authenticate_user!

	def search
	end

	def new
		@garage = Garage.new
	end

	def create
		@garage = Garage.create(garage_params)
		respond_to do |format|
			format.json { render json: @garage, status: :created, location: @garage }
		end
	end

	private
		def all_garages
			@garages = Garage.all
		end

	def garage_params
      params.require(:garage).permit(:name, :address, :latitude, :longitude, :average_cost)
    end
end
