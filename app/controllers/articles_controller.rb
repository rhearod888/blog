class ArticlesController < ApplicationController

	def index
     if params[:search]
     @articles = Article.where('title LIKE ?', "%#{params[:search]}%").all
     else
      @articles = Article.all
     end
    end


	def new
    @article = Article.new
	end

    def show
    @article = Article.find(params[:id])
    end

    def edit
    @article = Article.find(params[:id])
    end

	def create
    @article = Article.new(article_params)
      if @article.save
        flash[:success] = "Saving successful"
        redirect_to @article
      else
        flash.now[:error] = "Please check your entries"
        render 'new'
      end
    end


    def update
    @article = Article.find(params[:id])
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end

    def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    end

    private
    def article_params
    params.require(:article).permit(:title, :text)
    end
end
