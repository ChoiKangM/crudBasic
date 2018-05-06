Rails.application.routes.draw do
  # 루트 페이지는 memos 컨트롤러의 index 액션이다.
  # get '/' => 'memos#index'
  root 'memos#index'

  # Create

  # 글쓰는 창('/memos/new')는 memos 컨트롤러의 new액션이다.
  get '/memos/new' => 'memos#new'
  # 작성 완료 후('/memos/create')엔 memos 컨트롤러의 create액션으로 간다.
  get '/memos/create' => 'memos#create' 
  # get으로 넘기면 데이터가 보여 해킹 위험이 있습니다. 
  # 통신 방식을 post로 변경하고 url을 줄입니다.
  # post '/memos' => 'memos#create'
  # 하지만 우린 무식하게 진행합니다

  # Read

  # 뉴스피드(전체 글) 보러 memos 컨트롤러의 index액션으로 간다.
  get '/memos/index' => 'memos#index' # 효율적이지 못합니다 하지만 우린 무식합니다
  # get '/memos' => 'memos#index'
  
  # 원하는 글 하나 보러('/memos/:id/show') memos 컨트롤러의 show 액션으로 간다.
  get '/memos/:id/show' => 'memos#show' # 효율적이지 못합니다 무식하게 해보자
  # get '/memos/:id' => 'memos#show'
  
  # Update
  
  # 원하는 글('/memos/:id/edit') 수정하러 memos 컨트롤러의 edit 액션으로 간다. 
  get '/memos/:id/edit' => 'memos#edit'
  # 수정한 글을 저장하러('/memos/:id/update') memos 컨트롤러의 update 액션으로 간다.
  get '/memos/:id/update' => 'memos#update' # 해킹 위험 + 효율적이지 못합니다
  # patch '/memos/:id' => 'memos#update'

  # Delete
  # 원하는 글을 삭제하러('/memos/:id/destroy') memos 컨트롤러의 destroy 액션으로 간다.
  get '/memos/:id/destroy' => 'memos#destroy' # 오작동 위험 + 효율적이지 못합니다
  # delete '/memos/:id' => 'memos#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
