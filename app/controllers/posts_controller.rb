class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]
  # GET /posts
  # GET /posts.json
  def index
    if params[:location] || params[:post_type] || params[:keyword]
      @posts = Post.search(params[:location], params[:post_type], params[:keyword]).paginate(:page => params[:page], :per_page => 1).order("created_at DESC")
    else
      @posts = Post.where(:enabled => true).paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @image = @post.image.present?
    @posts = Post.all.limit(3).order("created_at DESC")
    @get_amentities = @post.amentity_ids 
    #@amentity_to_array = @get_amentities.gsub!(/[\[\]\"]/, "")
    # @amentities = @amentity_to_array.split(/,/)
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
    
  end

  # GET /posts/1/edit
  def edit
    # @get_amentities = @post.amentity_ids 
    # @amentity_to_array = @get_amentities.gsub!(/[\[\]\"]/, "")
    # @amentities = @amentity_to_array.split(/,/)
    # @int_amentities = @amentities.map(&:to_i)
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :post_type,:image, :size, :bathroom, :bedroom, :floor, :area, :address, :description, :price,:enabled, :property_type_id, :location_id, :amentity_ids => [], photos_attributes: [:id, :image,  :_destroy])
    end
end
