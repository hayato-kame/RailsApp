Rails.application.routes.draw do

  resources :mycontacts
  # 以下を一つにまとめてます ただし、これを書いても、リンクなどがうまく機能しませんの
  # resoutces :mycontacts を書かないと、やはりうまく機能しません
=begin
          get 'mycontacts', to: 'mycontacts#index'

          get 'mycontacts/new', to: 'mycontacts#new'
          post 'mycontacts', to: 'mycontacts#create'

          get 'mycontacts/:id', to: 'mycontacts#show'

          get 'mycontacts/:id/edit', to: 'mycontacts#edit'

          patch 'mycontacts/:id', to: 'mycontacts#update'
          put 'mycontacts/:id', to: 'mycontacts#update'

          get 'mycontacts/:id', to: 'mycontacts#destroy'
=end

  get 'messages/index'
  get 'messages', to: 'messages#index'

  get 'messages/add'
  post 'messages/add', to: 'messages#create'

  get 'messages/:id', to: 'messages#show'

  get 'messages/edit/:id', to: 'messages#edit'
  patch 'messages/edit/:id', to: 'messages#update'

  get 'messages/delete/:id', to: 'messages#delete'

  get 'cards/index'
  get 'cards' , to: 'cards#index'

# showよりも上に書くこと
  get 'cards/add'
  post 'cards/add'


  get 'cards/:id' , to: 'cards#show'

  get 'cards/edit/:id', to: 'cards#edit'
  patch 'cards/edit/:id', to: 'cards#edit'

  get 'cards/delete/:id' , to: 'cards#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'people/index'
  get 'people', to: 'people#index'
# showよりも上に書くこと
  get 'people/add'
  post 'people/add', to: 'people#create'
# showよりも上に書くこと
  get 'people/find'
  post 'people/find'

  get 'people/delete/:id', to: 'people#delete'

  # パラメータ付きアドレスのルーティングは関係するルーティングの一番下に書いてください
  get 'people/edit/:id' , to: 'people#edit'
  patch 'people/edit/:id', to: 'people#update'

  # パラメータ付きアドレスのルーティングは関係するルーティングの一番下に書いてください
  get 'people/:id', to: 'people#show'
end
