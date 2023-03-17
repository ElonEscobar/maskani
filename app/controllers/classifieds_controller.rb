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
        classified = Classified.create!(classified_params)
        render json: classified, status: :created
    end

    def update
        classified = Classified.update!(classified_params)
        render json: classified, status: :accepted
    end

    def destroy
        classified = Classified.find(params[:id])
        classified.destroy!
        head :no_content
    end

    private

    def classified_params
        params.permit(:first_name, :last_name, :email, :contact, :location, :occupation, :description)
    end

    def render_not_found_response
        render json: { error: "Classified not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
