class SightingsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        sightings = sighting.all
        render json: sightings
    end

    def show
        sighting = sighting.find(params[:id])
        render json: sighting
    end

    def create
        sighting = sighting.create(sighting_params)
        if sighting.valid?
          render json: sighting
        else
          render json: sighting.errors
        end
    end
    
    def update
        sighting = sighting.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
          render json: sighting
        else
          render json: sighting.errors
        end
    end

    def destroy
        sighting = sighting.find(params[:id])
        if sighting.destroy
          render json: sighting
        else
          render json: sighting.errors
        end
    end

    
    private
    def sighting_params
        params.require(:sighting).permit(:animal_id, :lat, :long, :date)
    end
end
