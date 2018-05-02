Rails.application.routes.draw do
  # get '/' => 'memos#index'
  root 'memos#index'
  # Create
  get '/memos/new' => 'memos#new'
  get '/memos/create' => 'memos#create' 
  # get으로 넘기면 데이터가 보여 해킹 위험이 있습니다. 
  # 통신 방식을 post로 변경하고 url을 줄입니다.
  # post '/memos' => 'memos#create'
  # 하지만 우린 무식하게 진행합니다

  # Read
  get '/memos/index' => 'memos#index' # 효율적이지 못합니다 하지만 우린 무식합니다
  # get '/memos' => 'memos#index'
  
  get '/memos/:id/show' => 'memos#show' # 효율적이지 못합니다 무식하게 해보자
  # get '/memos/:id' => 'memos#show'
  
  # Update
  get '/memos/:id/edit' => 'memos#edit'
  get '/memos/:id/update' => 'memos#update' # 해킹 위험 + 효율적이지 못합니다
  # patch '/memos/:id' => 'memos#update'

  # Delete
  get '/memos/:id/destroy' => 'memos#destroy' # 오작동 위험 + 효율적이지 못합니다
  # delete '/memos/:id' => 'memos#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
