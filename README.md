# Rails 게시판 만들기
> 레일즈에서 CRUD 구조를 이용해 게시판을 만듭니다.  

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

#### 액션
지난 시간에 배운 액션을 복습하려면 아래 링크로 갑니다.  
[`오늘 뭐 먹지?`에서 배운 액션](https://github.com/knulikelion/foodForToday#%EC%95%A1%EC%85%98)  

7가지 액션으로 `CRUD` 구조를 만듭니다.
* `Create` - 게시글을 만드는 `new`, `create` 액션       
* `Read`   - 게시글을 읽는 `index`, `show` 액션     
* `Update` - 게시글을 수정하는 `edit`, `update` 액션  
* `Delete` - 게시글을 삭제하는 `destroy` 액션  


