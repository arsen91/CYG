class RatingsController < ApplicationController
  def update
    @rating = Rating.find(params[:id])
    @garage = @rating.garage

    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
        format.json {render json: @garage.average_rating}
      end
    end
  end
end
