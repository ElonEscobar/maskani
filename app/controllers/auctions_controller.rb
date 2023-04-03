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
        response = Cloudinary::Uploader.upload(params[:image])
        @user = current_user()

        # check if image has been uploaded successfully
        if response['secure_url']
            auction = Auction.create!(name: params[:name], description: params[:description], price: params[:price], end_date: params[:end_date], user_id: @user.id)
            if auction
                render json: auction, status: :created, location: @auction
            else
                render json: auction.errors, status: :unprocessable_entity
            end
        else
            render json: { error: 'Image upload failed!'}, status: :unprocessable_entity
        end
    end

    def update
        if @auction.update!(auction_params)
            render json: @auction, status: :accepted
        else
            render json: @auction.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @auction.destroy!
        head :no_content
    end

    private

    def set_auction
        @auction = Auction.find(params[:id])
    end

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
