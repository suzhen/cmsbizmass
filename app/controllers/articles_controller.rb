#coding: utf-8 
class ArticlesController < ApplicationController
  before_filter :authenticate_user!  

  # GET /articles
  # GET /articles.json
  def index
   @articles=Article
   if params[:date].present?
     #"只有年" 
     if params[:date][:year].present? && !params[:date][:month].present?
       @articles=@articles.where(["DATE_FORMAT(created_at,'%Y') = ?",params[:date][:year]])  
     end
     #"只有年和月"
     if params[:date][:year].present? && params[:date][:month].present? && !params[:date][:day].present?
        created_date =  Date.civil(params[:date][:year].to_i, params[:date][:month].to_i,1)
       @articles=@articles.where(["DATE_FORMAT(created_at,'%Y-%m') = ?",created_date.strftime('%Y-%m')])  
     end
     #"年月日都有"
     if params[:date][:year].present? && params[:date][:month].present? && params[:date][:day].present?
        created_date =  Date.civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
        @articles=@articles.where(["DATE_FORMAT(created_at,'%Y-%m-%d') = ?",created_date])  
     end
   end
   
   cat = params[:category_id]
   til = params[:title]
   if til.present?
     @articles=@articles.where("title like '%#{til}%'")
   end  
   if cat.present?&&cat!=""&&cat!="0"
     @articles=@articles.where(["category_id=?",cat])
   end
   @articles=@articles.order("created_at DESC").page(params[:page])

   respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @article.category = Category.new
    @article.article_body = ArticleBody.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    @article.category_id=params[:category_id].to_i
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: '新闻创建成功。' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: '新闻更新成功。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def query
   key=params[:key]
   cat=params[:cat]
   @articles=Article
   if key.present?&&key!=""
     @articles=@articles.where("title like '%#{key}%'")
   end  
   if cat.present?&&cat!=""&&cat!="0"
     @articles=@articles.where(["category_id=?",cat])
   end
   @articles=@articles.page(params[:page])
   respond_to do |format|
      format.html# { render :layout => false}
      format.js
    end
  end


end
