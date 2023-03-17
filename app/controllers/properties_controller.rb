class PropertiesController < ApplicationController
    skip_before_action :authorized, only:[:index, :show]

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        properties = Property.all
        render json: properties, status: :ok
    end

    def show
        property = Property.find(params[:id])
        render json: property, status: :ok
    end

    def create
        property = Property.create!(property_params)
        render json: property, status: :created
    end

    def update
        property = Property.update!(property_params)
        render json: property, status: :accepted
    end

    def destroy
        property = Property.find(params[:id])
        property.destroy!
        head :no_content
    end

    private

    def property_params
        params.permit(:name, :location, :description, :amenities, :onsale, :price)
    end

    def render_not_found_response
        render json: { error: "Property not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
