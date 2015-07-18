Rails.application.routes.draw do

  root 'home#index'
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :users, :only => [:create] do
        member do
          get :employer_jobs
        end
      end
      resources :jobs, :only => [:create] do
        collection do
          post :search
        end
        member do
          post :applicant
          get :job_applicants
        end
      end
      resources :hires
    end
  end

end
