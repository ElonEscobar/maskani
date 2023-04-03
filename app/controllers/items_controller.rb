class ItemsController < ApplicationController
    skip_before_action :authorized, only:[:index, :show]


    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        items = Item.all
        render json: items, status: :ok
    end

    def show
        item = Item.find(params[:id])
        render json: item, status: :ok
    end

    def create
        response = Cloudinary::Uploader.upload(params[:image])

        @user = current_user()

        # byebug;
        # sometimes the image upload fails hence, check if upload was successful
        if response['secure_url']
            item = Item.create!(name: params[:name], description: params[:description], price: params[:price], category: params[:category], image_data: response['secure_url'], user_id: @user.id)

            if item        
                render json: item, status: :created, location: @item
            else
                render json: item.errors, status: :unprocessable_entity
            end
        else
            render json: { error: 'image upload failed!' }, status: :unprocessable_entity
        end
        
        
    end 

    def update
        if @item.update!(item_params)
            render json: @item, status: :accepted
        else
            render json: @item.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @item.destroy
        head :no_content
    end

    private

    def set_item
        @item = Item.find(params[:id])
    end

    def item_params
        params.permit(:name, :description, :price, :category, :image)
    end

    def render_not_found_response
        render json: { error: "Item not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
