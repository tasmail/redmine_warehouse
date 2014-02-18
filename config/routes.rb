resources :goods

match ':project_id/goods'  => "goods#index"
match ':project_id/goods/new'  => "goods#new"
match ':project_id/goods/:id'  => "goods#show"
match ':project_id/goods/:id/edit'  => "goods#edit"
