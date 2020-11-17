class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: true)
    end

    def new
        @book = Book.new
    end

    def show
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to books_path, notice: 'Se creó el libro' 
        else
            flash.now[:alert] = 'Libro no puede ser creado.'
            render :new
        end
    end

    def edit
    end
        
    def update
        if @book.update(book_params)
            redirect_to books_path, notice: 'El libro fue editado.'
        else
            flash.now[:alert] = 'Libro no puede ser creado'
            render :edit
        end
    end

    def destroy
        @book.destroy
        redirect_to books_url, notice: 'Libro fue eliminado.'
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :author, :genre, :status, :lent_to, :borrowed, :returned)
    end
end