class BooksController < ApplicationController
    
    def index
        @book = Book.new
        @books = Book.all
    end
    
    def create
        @book = Book.new(book_params)

        if @book.save
        redirect_to book_path(@book.id)
        flash[:notice] = "Book was successfully created."
        else
        @books = Book.all
        flash[:notice] = "2 errors prohibited this book from being saved:"
        render :index

        end
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        
        if @book.update(book_params)
         redirect_to book_path(@book.id)
         flash[:notice] = "Book was successfully created."
        else
         @books = Book.all
         flash[:notice] = "2 errors prohibited this book from being saved:"
         render :edit
         
        end
    end

    def destroy
        @book = Book.find(params[:id])  # データ（レコード）を1件取得
        @book.destroy  # データ（レコード）を削除
        redirect_to '/books'  # 投稿一覧画面へリダイレクト
        flash[:notice] = "Book was successfully destroyed."
    end

    private
    def book_params
     params.require(:book).permit(:title,:body)
    end

end
