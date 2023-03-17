class AuctionsController < ApplicationController
    skip_before_action :authorized, only:[:index, :show]

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        auctions = Auction.all
        render json: auctions, status: :ok
    end

    def show
        auction = Auction.find(params[:id])
        render json: auction, status: :ok
    end

    def create
        auction = Auction.create!(auction_params)
        render json: auction, status: :created
    end

    def update
        auction = Auction.update!(auction_params)
        render json: auction, status: :accepted
    end

    def destroy
        auction = Auction.find(params[:id])
        auction.destroy!
        head :no_content
    end

    private

    def auction_params
        params.permit(:name, :price, :description, :end_date)
    end

    def render_not_found_response
        render json: { error: "Auction not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
