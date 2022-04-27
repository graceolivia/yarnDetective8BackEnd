# frozen_string_literal: true

module Api
  class RavelryQuery
    def initialize(search_category, httparty)
      @search_category = search_category
      @httparty = httparty
      @allowed_queries = %w[yarns]
    end

    def search(query)
      if !@allowed_queries.include? @search_category
        'This query is not allowed. Please try again.'
      else
        @httparty.get_request("/#{@search_category}/search.json?query=#{query}")
      end
    end
  end
end
