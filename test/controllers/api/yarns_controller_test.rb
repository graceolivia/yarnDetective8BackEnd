# frozen_string_literal: true

require 'minitest/stub_any_instance'
require 'test_helper'

module Api
  class YarnsControllerTest < ActionDispatch::IntegrationTest
    test 'yarns route should render response' do
      HttpartyWrapper.stub_any_instance(:get_request, 'a string for testing purposes') do
      get '/api/yarns/'
      assert_response :success
      end
    end

    test 'should render page for a string search' do
      HttpartyWrapper.stub_any_instance(:get_request, 'a string for testing purposes') do
      get '/api/yarns?query=cascade'
      assert_response :success
      end
    end

    test 'should render page for a blank search' do
      HttpartyWrapper.stub_any_instance(:get_request, 'a string for testing purposes') do
      get '/api/yarns/yarns?query='
      assert_response :success
      end
    end

    test 'should render data passed from HTTParty to RavelryQuery to controller' do
      HttpartyWrapper.stub_any_instance(:get_request, 'a string for testing purposes') do
        get '/api/yarns/yarns?query=cascades%20bulky'
        assert_match 'a string for testing purposes', response.body
      end
    end

    test 'should render error in prescence of Ravelry forbidden message' do
      HttpartyWrapper.stub_any_instance(:get_request, '403 Forbidden') do
        get '/api/yarns/yarns?query=cascades%20bulky'
        assert_match 'Problem connecting to ravelry. Make sure you are connected.', response.body
      end
    end
  end
end
