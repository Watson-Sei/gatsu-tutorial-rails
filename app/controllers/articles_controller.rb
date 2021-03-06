class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def index
        @articles = Article.all.order(id: :desc)
    end

    def new 
        @article = Article.new
    end

    def create 
        @article = Article.new(article_params)

        if @article.save
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
    end

    def edit 
    end

    def update
        p '1111111111111'
        if @article.update(article_params)
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        p 'aaaaaaaaaaaaaa'
        @article.destroy
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end

        def set_article
            @article = Article.find(params[:id])
        end
end
