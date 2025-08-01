class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update]

    def index
        @article = Article.all
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create
       @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

   def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy!
    redirect_to root_path, status: :see_other, notice: '削除に成功しました'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end