Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :decks do
    resources :cards
  end
end
