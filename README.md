# Rails 게시판 만들기
> 레일즈에서 CRUD 구조를 이용해 게시판을 만듭니다.  
> 처음 만드니 코드가 돌아가는걸 목표로 무식하고 못생기게 만듭니다.    

[루비온레일즈 개발 가이드](http://guides.rubyonrails.org/v5.0/getting_started.html)를 참조해 만들었습니다.  
 
#### `MVC` 
위키피디아 검색결과
> 모델-뷰-컨트롤러(Model–View–Controller, MVC)는 소프트웨어 공학에서 사용되는 소프트웨어 디자인 패턴이다.   
> 이 패턴을 성공적으로 사용하면, 사용자 인터페이스로부터 비즈니스 로직을 분리하여   
> 애플리케이션의 시각적 요소나 그 이면에서 실행되는 비즈니스 로직을 서로 영향 없이 쉽게 고칠 수 있는 애플리케이션을 만들 수 있다.   
> `MVC`에서 `Model(모델)`은 애플리케이션의 정보(데이터)를 나타내며,   
> `View(뷰)`는 텍스트, 체크박스 항목 등과 같은 사용자 인터페이스 요소를 나타내고,   
> `Controller(컨트롤러)`는 데이터와 비즈니스 로직 사이의 상호동작을 관리한다.  

여윽시 위키피디아 알 수 없게 이야기합니다.   
지난 `오늘 뭐 먹지?(foodForToday)` 세션 때 MVC 수업을 되새기면  
`Model(모델)`은 데이터를 가공하고  
`View(뷰)`는 껍데기로 HTML, CSS로 만들고  
`Controller(컨트롤러)`는 Model과 View를 잇는 다리로 사용자가 한 일을 처리합니다.  

#### `CRUD`
위키피디아 검색결과
> CRUD는 대부분의 컴퓨터 소프트웨어가 가지는 기본적인 데이터 처리 기능인   
> `Create(생성)`, `Read(읽기)`, `Update(갱신)`, `Delete(삭제)`를 묶어서 일컫는 말이다.   
> 사용자 인터페이스가 갖추어야 할 기능(정보의 참조/검색/갱신)을 가리키는 용어로서도 사용된다.

제발 알아듣게 설명해줘...  
`Create(생성)` 만들고  
`Read(읽기)` 읽고  
`Update(갱신)` 수정하고  
`Delete(삭제)` 삭제한다  

어렵게 써뒀지만 핵심만 이해하면 어렵지 않습니다.  
실습 시작합니다.  

## 레일즈 프로젝트 생성하기
레일즈 프로젝트를 만듭니다.
```bash
$ rail new crudBasic
```
생성된 Rails 프로젝트 폴더로 이동합니다.
```bash
$ cd crudBasic
```

## model 만들기

레일즈엔 약속이 많습니다. 좋을 때도 안좋을 때도 있습니다.  
`Model`을 만들 땐 단수로 만듭니다.  
예를 들어,  
```bash
$ rails generate model Memo(단수)
```  
`Model`인 Memo는 단수로 만들어집니다.

이제 `Model`을 만들어 봅니다.
```bash
$ rails generate model Memo 
```
> 레일즈야 만들자 모델 이름은 Memo야

```bash
$ rails delete model Memo
```
> 레일즈야 지우자 지울 모델 이름은 Memo야

```bash
$ rails g model Memo title:string content:text
```
> 레일즈야 만들자 모델 이름은 Memo(게시글)야  
> 게시글의 Column(속성)으로 title(제목)은 string으로 content(내용)는 text로 만들어   



| Model(모델 이름) | Column(속성) |
|:----------------:|--------------|
|       `Memo`     | `title`:string |
|                  | `content`:text |


#### `Column`
`Model` 안의 `Column`은 게시글에 저장할 정보의 종류를 나타냅니다.   
위의 경우 `Memo` 게시글 안에는 `title`과 `content`가 존재합니다.



## controller 만들기
레일즈엔 약속이 많습니다. 좋을 때도 안좋을 때도 있습니다.  
`Controller`를 만들 땐 복수로 만듭니다.  
예를 들어,  

```bash
$ rails generate controller Memos(복수)
```  
`Controller`인 Memos는 복수로 만들어집니다.

이제 `Controller`를 만들어 봅니다.
```bash
$ rails g controller Memos
```
> 레일즈야 만들자 컨트롤러 이름은 Memos야   

```bash
$ rails d controller Memos 
```
> 레일즈야 지우자 지울 컨트롤러 이름은 Memos야

```bash
$ rails g controller Memos new edit index show
```
> 레일즈야 만들자 컨트롤러 이름은 Memos야  
> 안에 액션으로 new, edit, index, show를 만들어  

`new`, `edit`, `index`, `show` 액션은 사용자가 직접 보고 만질 수 있는 액션입니다.  
이유는 차차 설명하도록 하겠습니다.  

#### 액션
지난 시간에 배운 액션을 복습하려면 아래 링크로 갑니다.  
[`오늘 뭐 먹지?`에서 배운 액션](https://github.com/knulikelion/foodForToday#%EC%95%A1%EC%85%98)  
액션은 컨트롤러와 뷰를 연결하고 우리가 원하는 코드를 가지고 있습니다.  
컨트롤러(`이름s_controller`)는
```ruby
def 액션
  내가 원하는 코드가 모두 이루어지는 곳
  게시글을 만들고 보여주고 고치고 삭제합니다
  "@인스턴스변수"를 이용해 뷰와 소통합니다
  변수를 보내거나 가져옵니다
end
``` 
뷰(`액션.html.erb`)는
```html
<h1>HTML과 CSS로 모든 걸 보여주마</h1>
<h4><%= @인스턴스변수 %>는 컨트롤러의 해당 액션에서 불러옵니다 날아옵니다</h4>
<h4><% %>와 <%= %>로 루비 문법을 사용합니다.</h4>
```

7가지 액션으로 `CRUD` 구조를 만듭니다.
* `Create` - 게시글을 만드는 `new`, `create` 액션       
* `Read`   - 게시글을 읽는 `index`, `show` 액션     
* `Update` - 게시글을 수정하는 `edit`, `update` 액션  
* `Delete` - 게시글을 삭제하는 `destroy` 액션  

## `memos_controller.rb`에 `CRUD` 구조 만들 7가지 액션 만들기
`$ rails g controller Memos new edit index show`로 컨트롤러를 만들고   
컨트롤러 파일을 열어보면 아래의 상황입니다.  
#### `memos_controller.rb`
```ruby
class MemosController < ApplicationController
  def new
  end

  def edit
  end

  def index
  end

  def show
  end
end
```
현재 `new`,`edit`,`index`,`show` 4개의 액션이 존재합니다.  
`CRUD` 구조를 완성하기 위해 `create`,`update`,`destroy` 액션을 추가합니다.   
```ruby
class MemosController < ApplicationController
  # CREATE
  def new
  end

  def create
  end
  # READ
  def index
  end

  def show
  end
  # UPDATE
  def edit
  end

  def update
  end
  # DELETE
  def destroy
  end
end
```
`Create`와 `Read`를 만들기 전 `HTTP`와 `REST`에 대해 알아보자

#### `HTTP`
`get`과 `post`는 `router`에서 사용하는 외계어로 보이는 용어입니다.  
웹에서 사용하는 `HTTP` 통신 프로토콜에서 사용됩니다.  
위키피디아 검색결과  
> HTTP(HyperText Transfer Protocol, 문화어: 초본문전송규약, 하이퍼본문전송규약)는 WWW 상에서 정보를 주고받을 수 있는 프로토콜이다.  
> 주로 HTML 문서를 주고받는 데에 쓰인다. TCP와 UDP를 사용하며, 80번 포트를 사용한다. 1996년 버전 1.0, 그리고 1999년 1.1이 각각 발표되었다.  
> HTTP는 클라이언트와 서버 사이에 이루어지는 요청/응답(request/response) 프로토콜이다.  
> 예를 들면, 클라이언트인 웹 브라우저가 HTTP를 통하여 서버로부터 웹페이지나 그림 정보를 요청하면,  
> 서버는 이 요청에 응답하여 필요한 정보를 해당 사용자에게 전달하게 된다. 이 정보가 모니터와 같은 출력 장치를 통해 사용자에게 나타나는 것이다.  
> HTTP를 통해 전달되는 자료는 http:로 시작하는 URL(인터넷 주소)로 조회할 수 있다.

어렵다..  
`HTTP`는 웹에서 사용하는 통신 방법이라 생각하자

#### `REST`
`REST`는 HTTP가 효율적으로 통신하는 방법이다.  
위키피디아 검색결과
> REST(Representational State Transfer)는 월드 와이드 웹과 같은 분산 하이퍼미디어 시스템을 위한 소프트웨어 아키텍처의 한 형식이다.   
> 이 용어는 로이 필딩(Roy Fielding)의 2000년 박사학위 논문에서 소개되었다. 필딩은 HTTP의 주요 저자 중 한 사람이다. 이 개념은 네트워킹 문화에 널리 퍼졌다.  
> 엄격한 의미로 REST는 네트워크 아키텍처 원리의 모음이다. 여기서 '네트워크 아키텍처 원리'란 자원을 정의하고 자원에 대한 주소를 지정하는 방법 전반을 일컫는다.   
> 간단한 의미로는, 웹 상의 자료를 HTTP위에서 SOAP이나 쿠키를 통한 세션 트랙킹 같은 별도의 전송 계층 없이 전송하기 위한 아주 간단한 인터페이스를 말한다.   
> 이 두 가지의 의미는 겹치는 부분과 충돌되는 부분이 있다. 필딩의 REST 아키텍처 형식을 따르면 HTTP나 WWW이 아닌 아주 커다란 소프트웨어 시스템을 설계하는 것도 가능하다.   
> 또한, 리모트 프로시저 콜 대신에 간단한 XML과 HTTP 인터페이스를 이용해 설계하는 것도 가능하다.  
> 필딩의 REST 원리를 따르는 시스템은 종종 RESTful이란 용어로 지칭된다. 열정적인 REST 옹호자들은 스스로를 RESTafrians 이라고 부른다.  

이해가 불가능하다..  
정리하면 `get` `post` `patch` `delete`를 이용해 효율적으로 통신한다.  
`get`은 URL창에 정보를 보여주며 통신하고  
`post`는 정보를 숨기며 통신한다.  
이번 세션에는 `REST`를 적용해 라우터를 사용하긴 힘드니  
`get`과 `post`가 존재한다는 것만 알아둡시다.  
.

## `routes.rb`
`$ rails g controller Memos new edit index show`로 컨트롤러를 만들면   
`router`에 레일즈는 자동으로 필요한 구문을 추가합니다 
#### `routes.rb` 
```ruby
Rails.application.routes.draw do
  get 'memos/new'

  get 'memos/edit'

  get 'memos/index'

  get 'memos/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
```
웹의 표지판으로 `router`가 역활을 하기엔 위의 코드론 부족합니다.  
`Create`와 `Read`에 필요한 코드를 추가합니다.
```ruby
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
```

라우터에서 `root`는 메인 페이지로 가게 합니다.  
`root 'memos#index'`는 `# get '/' => 'memos#index'`와 같습니다.  
  
#### `Create`
`new` **새로운 메모를 쓰자**   
`get '/memos/new' => 'memos#new'`는   
`/memos/new` URL로 들어오면 `memos(컨트롤러)#new(액션)`로 보냅니다.    
사용자가 새로운 글을 쓰는 액션(페이지) 입니다.  

`create` **새로운 메모를 만들자**   
`get '/memos/create' => 'memos#create'`는  
`/memos/create` URL로 들어오면 `memos(컨트롤러)#create(액션)`로 보냅니다.    
쓴 글 내용을 받아 데이터로 저장하는 액션입니다. 

#### `Read`
`index` **모든 메모 읽기**   
`get '/memos/index' => 'memos#index'`는  
`/memos/index` URL로 들어오면 `memos(컨트롤러)#index(액션)`로 보냅니다.  
모든 글을 보여주는 액션(페이지)입니다.  

`show` **원하는 메모 읽기**   
`get '/memos/:id/show' => 'memos#show'`는  
`/memos/:id/show` URL로 들어오면 `memos(컨트롤러)#show(액션)`로 보냅니다.  
원하는 글을 보여주는 액션(페이지)입니다.    
`:id`는 원하는 게시글을 선택합니다.


URL로 레일즈가 다닐 길에 웹의 표지판인 router 설정이 끝났습니다.  
CRUD에서 CR을 먼저 만들어봅니다.  
## `memos_controller.rb` 내부 액션 로직 채우기
컨트롤러에서 `new`,`create`,`index`,`show` 액션 내부를 채워봅니다.  
```ruby
class MemosController < ApplicationController
  # CREATE
  def new
    # Memo 모델 중 새로운 객체를 생성해 @memo에 저장합니다
    @memo = Memo.new
  end

  def create
    # Memo 모델 중 새로운 객체를 생성해 @memo에 저장합니다
    @memo = Memo.new
    # @memo의 title애 new.html.erb의 title 변수의 내용을 넣습니다
    @memo[:title] = params[:title]
    # @memo의 content애 new.html.erb의 content 변수의 내용을 넣습니다
    @memo[:content] = params[:content]
    # params가 넘어오는걸 debugger로 확인해봅시다
    # @memo를 저장합니다
    @memo.save

    # 저장 후 메인페이지로 갑니다
    redirect_to root_path
    # redirect_to '/' 와 동일합니다
    # 왜 그럴까요?
  end
  # READ
  def index
    # 모든 Memo들을 보여줍니다
    @memos = Memo.all
  end

  def show
    # 원하는 id의 Memo를 보여줍니다
    @memo = Memo.find(params[:id])
  end

  # UPDATE
  def edit
  end

  def update
  end
  # DELETE
  def destroy
  end
end
```
#### HTML `form`
[HTML form - w3schools](https://www.w3schools.com/html/html_forms.asp) 참조합시다  

#### `CSRF`공격
피싱 사이트 등 사이트 위변조를 통해 시도하는 해킹 방법입니다.  
이를 막기 위해 정보를 교환할때 토큰을 교환합니다. 자세한 방법은 아래 링크를 참조합시다.  
[CSRF prevention](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet)  
레일즈에서 글을 쓸때 `form` 태그 안에   
`<%= hidden_field_tag :authenticity_token, form_authenticity_token %>` 코드를 입력합니다.  

## `new.html.erb`
```erb
<h1>새글 쓰기</h1>
<!-- 현재 new 액션은 글을 직접 쓰는 곳이고 -->
<!-- 글 내용은 create 액션으로 보내어 Memo 모델로 저장합니다. -->
<form action="/memos/create">
  <!-- 글을 쓸 때 해킹을 예방할 토큰을 함께 보냅니다  -->
  <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
  제목 <br>
  <input type="text" name="title" placeholder="제목을 입력하세요">
  <br>
  내용 <br>
  <textarea name="content" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea>
  <br>
  <!-- form 태그를 submit 타입으로 제출해야 글이 써집니다. -->
  <input type="submit" value="글쓰기">
</form> 
```
## `index.html.erb`
```erb
<!-- /memos/new는 routes.rb에서 설정했습니다 -->
<a href="/memos/new">글쓰기</a> <br>
<!-- 모든 메모들을 불러와 하나씩 보여줍니다 -->
<% @memos.each do |m| %>
    <!-- 제목을 누르면 해당 글로 이동합니다 -->
    <h1>제목 : <a href="/memos/<%= m.id %>/show"><%= m.title %></a></h1>
    <br>
    <h4>내용 : <%= m.content %></h4>
    <hr>
<% end %>
```

## `show.html.erb`
```erb
<!-- 글의 제목과 내용을 보여줍니다 -->
<h1>제목 : <%= @memo.title %></h1>
<p>내용 : <%= @memo.content %></p>
<!-- 목록으로 돌아갑니다 -->
<a href="/memos/index">목록으로</a>
```
## `UD`
여기까지 `CRUD` 구조 중 `CR`까지 완료하였습니다.  
이제 남은 `UD`인 `Update`와 `Delete`를 시작해봅시다
## `memos_controller.rb`
```ruby
class MemosController < ApplicationController
  # CREATE
  def new
    # Memo 모델 중 새로운 객체를 생성해 @memo에 저장합니다
    @memo = Memo.new
  end
  def create
    # Memo 모델 중 새로운 객체를 생성해 @memo에 저장합니다
    @memo = Memo.new
    # @memo의 title애 new.html.erb의 title 변수의 내용을 넣습니다
    @memo[:title] = params[:title]
    # @memo의 content애 new.html.erb의 content 변수의 내용을 넣습니다
    @memo[:content] = params[:content]
    # params가 넘어오는걸 debugger로 확인해봅시다
    # @memo를 저장합니다
    @memo.save

    # 저장 후 메인페이지로 갑니다
    redirect_to root_path
    # redirect_to '/' 와 동일합니다
    # 왜 그럴까요?
  end

  # READ
  def index
    # 모든 Memo들을 보여줍니다
    @memos = Memo.all
  end
  def show
    # 원하는 id의 Memo를 보여줍니다
    @memo = Memo.find(params[:id])
  end

  # UPDATE
  def edit
    # 수정할 Memo를 보여줍니다
    @memo = Memo.find(params[:id])
    # /memos/:id/edit에서 수정합니다
  end

  def update
    # 수정할 Memo를 찾습니다
    @memo = Memo.find(params[:id])
    # @memo의 title애 edit.html.erb의 수정된 title 변수를 넣습니다
    @memo[:title] = params[:title]
    # @memo의 content애 edit.html.erb의 수정된 content 변수를 넣습니다
    @memo[:content] = params[:content]
    # debugger
    # @memo를 저장합니다
    @memo.save

    # 수정된 게시글을 보러 갑니다.
    redirect_to "/memos/#{@memo.id}/show"
  end

  # DELETE
  def destroy
    # 삭제할 Memo를 찾습니다
    @memo = Memo.find(params[:id])
    # 삭제합니다
    @memo.destroy
    # 메인페이지로 갑니다
    redirect_to '/'
  end
end
```
## `routes.rb`
```ruby
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

```

## `edit.html.erb`
```erb
<h1>수정하기</h1>
<!-- 현재 edit 액션은 글을 직접 수정하는 곳이고 -->
<!-- 글 내용은 update 액션으로 보내어 해당 Memo를 수정합니다. -->
<form action="/memos/<%= @memo.id%>/update">
  <!-- 글을 쓸 때 해킹을 예방할 토큰을 함께 보냅니다  -->
  <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
  제목 <br>
  <input type="text" name="title" value="<%= @memo.title%>">
  <br>
  내용 <br>
  <textarea name="content" cols="30" rows="10"><%=@memo.content%></textarea>
  <br>
  <!-- form 태그를 submit 타입으로 제출해야 글이 써집니다. -->
  <input type="submit" value="글쓰기">
</form>
```

## `show.html.erb`
```erb
<!-- 글의 제목과 내용을 보여줍니다 -->
<h1>제목 : <%= @memo.title %></h1>
<p>내용 : <%= @memo.content %></p>
<!-- 수정페이지로 갑니다 -->
<a href="/memos/<%=@memo.id%>/edit">수정하기</a>
<!-- 글을 삭제합니다 -->
<a href="/memos/<%=@memo.id%>/destroy"data-confirm="정말로 삭제합니까?">삭제하기</a>
<!-- 목록으로 돌아갑니다 -->
<a href="/memos/index">목록으로</a>
```
코드가 돌아가는걸 목표로 무식하게 `CRUD`를 만들어 봤습니다.  
수고 많으셨습니다. 다음 수업엔 이쁘게 만들어 봅시다.  
