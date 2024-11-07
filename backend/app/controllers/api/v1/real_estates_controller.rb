# frozen_string_literal: true

module Api
  module V1
    # Controller for managing real estate resources in the API.
    class RealEstatesController < ApplicationController
      before_action :set_real_estate, only: %i[show update destroy]

      def index
        @real_estates = RealEstate.all
        render json: @real_estates
      end

      def show
        render json: @real_estate
      end

      def create
        @real_estate = RealEstate.new(real_estate_params)
        if @real_estate.save
          render json: @real_estate, status: :created
        else
          render json: @real_estate.errors, status: :unprocessable_entity
        end
      end

      def update
        if @real_estate.update(real_estate_params)
          render json: @real_estate
        else
          render json: @real_estate.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @real_estate.destroy
        head :no_content
      end

      def search
        @real_estates = RealEstate.geo_search(params[:q])
        render json: @real_estates
      end

      private

      def set_real_estate
        @real_estate = RealEstate.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'RealEstate not found' }, status: :not_found
      end

      def real_estate_params
        params.require(:real_estate).permit(:price_per_month, :size, :build_date, :furnished, :available_for,
                                            :furnished_level, :title, :description, :owner_id,
                                            rooms_attributes: %i[id gender size description],
                                            real_estates_amenities_attributes: %i[id amenity_id real_estate_id],
                                            address_attributes: %i[id street city state postal_code country country_code
                                                                   state_code])
      end
    end
  end
end
