Rails.application.routes.draw do
  # API Definiton
  namespace :api, defaults: { format: :json },
  constraints: { subdomain: 'api'}, path: '/' do

  end
end
