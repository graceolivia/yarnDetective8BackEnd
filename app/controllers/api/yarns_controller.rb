# frozen_string_literal: true

module Api
  class YarnsController < ApplicationController
    include HTTParty
    def show
      httparty = Api::HttpartyWrapper.new
      ravelry_query = Api::RavelryQuery.new('yarns', httparty)
      query = params[:query]
      rsearch = ravelry_query.search(query)
      if rsearch.include? '403 Forbidden'
        render json: '{ "error" : "Problem connecting to ravelry. Make sure you are connected.",' \
        ' "status": "500 Internal Server Error"}'
      else
        render json: rsearch
      end
    end
  end
end
