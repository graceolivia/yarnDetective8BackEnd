# frozen_string_literal: true

require 'test_helper'

module Api
  class RavelryQueryTest < Minitest::Test
    def test_valid_ravelry_query_search_should_call_httparty_wrapper
      httparty = Api::HttpartyWrapper.new
      httparty.stub :get_request, 'expected return data' do
        ravelry_query = Api::RavelryQuery.new('yarns', httparty)
        assert_equal ravelry_query.search('red heart'), 'expected return data'
      end
    end

    def test_call_to_ravelry_with_bad_category_returns_error_message
      httparty = Api::HttpartyWrapper.new
      ravelry_query = Api::RavelryQuery.new('something not allowed', httparty)
      assert_equal ravelry_query.search('red heart'), 'This query is not allowed. Please try again.'
    end
  end
end
