require "test_helper"

module Api
  class PatternsControllerTest < ActionDispatch::IntegrationTest
    test 'patterns route should render response' do
      get '/api/patterns/'
      assert_response :success
    end

    test 'should render page for a string search' do
      get '/api/patterns.json?query=cascade'
      assert_response :success
    end

    test 'should render page for a blank search' do
      get '/api/patterns.json?query='
      assert_response :success
    end
  end
end