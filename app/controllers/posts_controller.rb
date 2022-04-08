class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy versions version revert]
  before_action :set_version, only: [:version, :revert]
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
        format.html { redirect_to posts_url, notice: "Post was successfully created." }
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
   
    redirect_to posts_path
  else
    render 'edit'
  end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
   
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def versions
    @posts = @post.versions
    # binding.pry
  end

  def version
  end

  def revert
    @reverted_post = @version.reify
    if @reverted_post.save
      redirect_to @post, notice: "Article was successfully reverted."
    else
      render version
    end
  end

  def deleted
    @posts = PaperTrail::Version.where(item_type: "Post", event: "destroy").order(created_at: :desc)
  end

  def restore
    @latest_version = Post.new(id: params[:id]).versions.last
    if @latest_version.event == "destroy"
      @post = @latest_version.reify
      if @post.save
        redirect_to posts_path, notice: "Article was successfully restored."
      else
        render :deleted
      end
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_version
      @version = PaperTrail::Version.find_by(item_id: @post, id: params[:version_id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
