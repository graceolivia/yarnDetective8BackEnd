# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resource :yarns do
      resource :yarns
    end
  end
end
