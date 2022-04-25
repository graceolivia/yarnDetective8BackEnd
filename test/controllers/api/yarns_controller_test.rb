# frozen_string_literal: true

require 'test_helper'

module Api
  class YarnsControllerTest < ActionDispatch::IntegrationTest
    test 'yarns route should render response' do
      get '/api/yarns/'
      assert_response :success
    end

    test 'should render page for a string search' do
      get '/api/yarns.json?query=cascade'
      assert_response :success
    end

    test 'should render page for a blank search' do
      get '/api/yarns/yarns.json?query='
      assert_response :success
    end
  end
end
