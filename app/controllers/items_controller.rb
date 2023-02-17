class ItemsController < ApplicationController
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
        item = Item.create!(item_params)
        render json: item, status: :created
    end

    def update
        item = Item.update!(item_params)
        render json: item, status: :accepted
    end

    def destroy
        item = Item.find(params[:id])
        item.destroy!
        head :no_content
    end

    private

    def item_params
        params.permit(:name, :description, :price, :category)
    end

    def render_not_found_response
        render json: { error: "Item not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
