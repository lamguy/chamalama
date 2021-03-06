class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :vote_up, :vote_down]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    # @article.create_activity key: 'article.commented_on', owner: current_user
    @article = Article.friendly.find(params[:article_id])

    @comment = current_user.comments.build(comment_params)
    @comment.article_id = @article.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote_up
    @article = Article.friendly.find(params[:article_id])
    
    respond_to do |format|
      if @comment.add_or_update_evaluation(:votes, 1, current_user)
        format.json { render json: Integer(@comment.reputation_for(:votes)), status: :ok, location: article_comment_path(@article, @comment) }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end  
    end
  end

  def vote_down
    @article = Article.friendly.find(params[:article_id])
    respond_to do |format|
      if @comment.add_or_update_evaluation(:votes, -1, current_user)
        format.json { render json: Integer(@comment.reputation_for(:votes)), status: :ok, location: article_comment_path(@article, @comment) }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end  
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :article_id, :comment)
    end
end
