# frozen_string_literal: true

module Api
  class YarnsController < ApplicationController
    include HTTParty
    def show
      httparty = Api::HttpartyWrapper.new
      ravelry_query = Api::RavelryQuery.new('yarns', httparty)
      query = params[:query]
      rsearch = ravelry_query.search(query)
      render json: rsearch
    end
  end
end
