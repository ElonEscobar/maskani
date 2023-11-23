class ClassifiedsController < ApplicationController
    skip_before_action :authorized, only:[:index, :show]

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        classifieds = Classified.all
        render json: classifieds, status: :ok
    end

    def show
        classified = Classified.find(params[:id])
        render json: classified, status: :ok
    end

    def create
        response = Cloudinary::Uploader.upload(params[:image])
        @user = current_user()
        # byebug;
        # sometimes the image upload fails hence, check if upload was successful
        if response['secure_url']
            classified = Classified.create!(first_name: params[:name], location: params[:location],  description: params[:description], image_data: response['secure_url'], user_id: @user.id)

            if classified
                render json: classified, status: :created
            else
                render json: classified.errors, status: :unprocessable_entity
            end
        else
            render json: { error: 'Image upload failed!' }, status: :unprocessable_entity
        end
    end

    def update
        res = Cloudinary::Uploader.upload(params[:image])
        classified = Classified.find(params[:id])
        if res['secure_url']
            classified.update!(first_name: params[:name], location: params[:location],  description: params[:description], image_data: res['secure_url'])
            render json: classified, status: :accepted
        else
            render json: classified.errors, status: :unprocessable_entity
        end
    end

    def destroy
        classified = Classified.find(params[:id])
        classified.destroy!
        head :no_content
    end

    private

    def render_not_found_response
        render json: { error: "Classified not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
