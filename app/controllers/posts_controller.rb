class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
   
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = Post.find_by_id(params[:id])
  if @post.update(post_params)
    flash[:success] = "Post was updated! #{make_undo_link}"
    redirect_to post_path(@post)
  else
    render 'edit'
  end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    flash[:success] = "Post was deleted! #{make_undo_link}"
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def history
    @versions = PaperTrail::Version.order('created_at DESC')
  end

  def undo
    @post_version = PaperTrail::Version.find_by_id(params[:id])
  
    begin
      if @post_version.reify
        @post_version.reify.save
      else
        @post_version.item.destroy
      end
      flash[:success] = "Undid that..."
    rescue
      flash[:alert] = "Failed undoing the action..."
    ensure
      redirect_to root_path
    end
  end

  private
    def make_undo_link
      view_context.link_to 'Undo that plz!', undo_path(@post.versions.last), method: :post
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
