Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users,
               path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :customers
      scope module: :stores do
        resources :branches, path: 'stores/branches'
      end
    end
  end
end
