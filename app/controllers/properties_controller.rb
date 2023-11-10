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
        response = Cloudinary::Uploader.upload(params[:image])

        @user = current_user()
        # byebug;
        # sometimes the image upload fails hence, check if upload was successful

        if response['secure_url']
            property = Property.create!(name: params[:name], location: params[:location], description: params[:description], amenities: params[:amenities], home_type: params[:home_type], price: params[:price], user_id: @user.id, image_data: response['secure_url'])
            if property
                render json: property, status: :created, location: @property
            else
                render json: property.errors, status: :unprocessable_entity
            end
        else
            render json: { error: 'Image upload failed!' }, status: :unprocessable_entity
        end
    end

    def update
        if @property.update!(property_params)
            render json: @property, status: :accepted
        else
            render json: @property.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @property.destroy!
        head :no_content
    end

    private

    def set_property
        @property = Property.find(params[:id])
    end


    def property_params
        params.permit(:name, :location, :description, :amenities, :price, :home_type)
    end

    def render_not_found_response
        render json: { error: "Property not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
