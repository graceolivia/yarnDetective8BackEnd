module Api
    class PatternsController < ApplicationController
      include HTTParty
      def show
        httparty = Api::HttpartyWrapper.new
        ravelry_query = Api::RavelryQuery.new('patterns', httparty)
        query = params[:query]
        rsearch = ravelry_query.search(query)
        render json: rsearch
      end
    end
  end
