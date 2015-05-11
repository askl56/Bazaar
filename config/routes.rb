Rails.application.routes.draw do
  # API Definiton
  namespace :api, defaults: { format: :json },
  constraints: { subdomain: 'api'}, path: '/' do
    scope module: :v1 do

    end
  end
end
