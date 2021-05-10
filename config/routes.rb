Rails.application.routes.draw do
  get 'cards/index'
  get 'cards' , to: 'cards#index'


  get 'cards/add'
  post 'cards/add'

  get 'cards/:id' , to: 'cards#show'
  
  get 'cards/edit/:id', to: 'cards#edit'
  patch 'cards/edit/:id', to: 'cards#edit'

  get 'cards/delete/:id' , to: 'cards#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'people/index'
  get 'people', to: 'people#index'

  get 'people/add'
  post 'people/add', to: 'people#create'

  get 'people/delete/:id', to: 'people#delete'

  # パラメータ付きアドレスのルーティングは関係するルーティングの一番下に書いてください
  get 'people/edit/:id' , to: 'people#edit'
  patch 'people/edit/:id', to: 'people#update'

  # パラメータ付きアドレスのルーティングは関係するルーティングの一番下に書いてください
  get 'people/:id', to: 'people#show'
end
