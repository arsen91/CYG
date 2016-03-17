class GaragesController < ApplicationController
	before_action :all_garages, only: [:new]
	respond_to :html, :js
	before_filter :authenticate_user!, except: [:search]

	def show
		@comment = Comment.new
		@comments = get_comments.reverse
		@garage = Garage.find(params[:id])
	end

	def search
		@found_garages = result_garages = Garage.search_query(params[:search]).average_cost(params[:average_cost])
		result_garages = assign_rating

		respond_to do |format| 
			format.json {render json: result_garages}
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
		def assign_rating
			@found_garages.map do |garage|
				if current_user
					rating = Rating.where(garage_id: garage.id, user_id: current_user.id).first 
					unless rating 
					    rating = Rating.create(garage_id: garage.id, user_id: current_user.id, score: 0)
					end
					
					{ garage: garage, rating: { id: rating.id, average: garage.average_rating } }
				else 
					{ garage: garage, rating: { average: garage.average_rating } }
				end
			end
		end

		def all_garages
			@garages = Garage.all
		end

		def garage_params
	      params.require(:garage).permit(:name, :address, :latitude, :longitude, :average_cost, :start_time, :end_time, :working_days)
	    end

	    def get_comments
	    	comments = Comment.where(garage_id: params[:id])
	    	comments.map do |comment|
	    		{ commentObj: comment, user_name: comment.get_user.full_name, user_score: comment.get_user.get_rating(comment.garage_id).first.score }
	    	end
	    end
end
