Rails.application.routes.draw do
  get 'feed' => 'apartments#index', as: :apartments_feed
end
