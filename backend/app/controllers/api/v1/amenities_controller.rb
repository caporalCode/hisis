# frozen_string_literal: true

module Api
  module V1
    # Controller for managing amenities in the API.
    class AmenitiesController < ApplicationController
      before_action :set_amenity, only: %i[show update destroy]

      # GET /api/v1/amenities
      def index
        @amenities = Amenity.all
        render json: AmenityBlueprint.render(@amenities, root: :data)
      end

      # GET /api/v1/amenities/:id
      def show
        render json: AmenityBlueprint.render(@amenity)
      end

      # POST /api/v1/amenities
      def create
        @amenity = Amenity.new(amenity_params)
        if @amenity.save
          render json: AmenityBlueprint.render(@amenity), status: :created
        else
          render json: @amenity.errors, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/amenities/:id
      def update
        if @amenity.update(amenity_params)
          render json: AmenityBlueprint.render(@amenity)
        else
          render json: @amenity.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/amenities/:id
      def destroy
        @amenity.destroy
        head :no_content
      end

      private

      def set_amenity
        @amenity = Amenity.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Amenity not found' }, status: :not_found
      end

      def amenity_params
        params.require(:amenity).permit(:name, :description, :price)
      end
    end
  end
end
