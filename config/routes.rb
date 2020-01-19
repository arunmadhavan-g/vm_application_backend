Rails.application.routes.draw do

  resources :application_form
  get "/find_by_phone/:phone", to: "application_form#find_by_phone"

  get "/started", to: "control#started"
  put "/start", to: "control#start"
  put "/stop", to: "control#stop"

  devise_for :admins, controllers: {
      sessions: 'admins/sessions'
  }, defaults: {format: :json}

end
