Rails.application.routes.draw do

	namespace :api do
    namespace :v1 do
			mount_devise_token_auth_for 'Teacher', at: 'auth'

			resources :teachers
			resources :messages
			resources :students
			resources :channels

		end
	end

end
