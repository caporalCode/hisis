# frozen_string_literal: true

module Api
  module V1
    # SearchesController handles API requests for searches.
    class SearchesController < ApplicationController
      before_action :set_search, only: %i[show update destroy]

      def index
        @searches = Search.all
        render json: @searches
      end

      def show
        render json: @search
      end

      def create
        @search = Search.new(search_params)
        if @search.save
          render json: @search, status: :created
        else
          render json: @search.errors, status: :unprocessable_entity
        end
      end

      def update
        if @search.update(search_params)
          render json: @search
        else
          render json: @search.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @search.destroy
        head :no_content
      end

      private

      def set_search
        @search = Search.find(params[:id])
      end

      def search_params
        params.require(:search).permit(:name, :description, :search_result)
      end
    end
  end
end
