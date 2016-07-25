class ServicesController < ApplicationController
    def index
        @service = Service.new
        @garage = Garage.find(params[:garage_id])
        @services = Service.where(garage_id: params[:garage_id])
        @garage_id = params[:garage_id]
    end

    def create
        @service = Service.create(service_params)
        respond_to do |format|
            format.json { render json: { service: @service } }
        end
    end

    private
        def service_params
            servParams = params.require(:service).permit(:title)
            servParams[:garage_id] = params[:garage_id]
            servParams
        end
end
