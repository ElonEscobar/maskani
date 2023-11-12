require 'byebug'

class PropertiesController < ApplicationController
    # skip_before_action :authorized, only:[:index, :show]

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
        # upload image to cloudinary      
        res = Cloudinary::Uploader.upload(params[:image])
        
        property = Property.find(params[:id])

        if res['secure_url']
            property.update!(name: params[:name], location: params[:location], description: params[:description], amenities: params[:amenities], home_type: params[:home_type], price: params[:price], image_data: res['secure_url'])
            render json: property, status: :accepted
        else
            render json: property.errors, status: :unprocessable_entity
        end
    end

    def destroy
        property = Property.find(params[:id])
        property.destroy!
        head :no_content
    end

    private

    def render_not_found_response
        render json: { error: "Property not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
