Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        post "/developerservice", to: "developers#create", format: true
        post "/teamservice", to: "teams#create", format: true
        post "/notificationservice", to: "notifications#alert", format: true

      end
    end
  end

end
