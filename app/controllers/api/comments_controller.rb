class Api::CommentsController < ApplicationController
  before_action :set_api_comment, only: [:show, :edit, :update, :destroy]

  # GET /api/comments
  # GET /api/comments.json
  def index
    @api_comments = Api::Comment.all
  end

  # GET /api/comments/1
  # GET /api/comments/1.json
  def show
  end

  # GET /api/comments/new
  def new
    @api_comment = Api::Comment.new
  end

  # GET /api/comments/1/edit
  def edit
  end

  # POST /api/comments
  # POST /api/comments.json
  def create
    @api_comment = Api::Comment.new(api_comment_params)

    respond_to do |format|
      if @api_comment.save
        format.html { redirect_to @api_comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @api_comment }
      else
        format.html { render :new }
        format.json { render json: @api_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/comments/1
  # PATCH/PUT /api/comments/1.json
  def update
    respond_to do |format|
      if @api_comment.update(api_comment_params)
        format.html { redirect_to @api_comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_comment }
      else
        format.html { render :edit }
        format.json { render json: @api_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/comments/1
  # DELETE /api/comments/1.json
  def destroy
    @api_comment.destroy
    respond_to do |format|
      format.html { redirect_to api_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_comment
      @api_comment = Api::Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_comment_params
      params.require(:api_comment).permit(:—skip-template-engine)
    end
end
