class MemosController < ApplicationController
  # CREATE
  def new
    # Memo 모델 중 새로운 객체를 생성해 @memo에 저장합니다
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
