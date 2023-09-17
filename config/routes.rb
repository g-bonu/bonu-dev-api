# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  scope module: 'api', path: 'api', defaults: { format: :json } do
    resources :projects, only: %i[index show] do
      resources :project_images, only: %i[index]
      resources :project_tags, only: %i[index]
    end

    devise_for :admins, path: 'admin', controllers: {
      sessions: 'sessions'
    }
    namespace :admin, path: 'admin' do
      devise_scope :admins do
        resources :projects, only: %i[index show create update destroy] do
          resources :project_images, only: %i[index create destroy]
          resources :project_tags, only: %i[index create destroy]
        end
      end
    end
  end
end
