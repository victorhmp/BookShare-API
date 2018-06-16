class WishlistItemsController < ApiController
  before_action :set_wishlist_item, only: [:show, :update, :destroy]
  before_action :require_login, except: [:index, :show, :show_by_wishlist]
  rescue_from ActiveRecord::RecordNotFound, :with => :return_404

  # GET /wishlist_items
  def index
    @wishlist_items = WishlistItem.all

    render json: @wishlist_items
  end

  # GET /wishlist_items/1
  def show
    render json: @wishlist_items
  end

  # GET /wishlist_items/wishlist/1
  def show_by_wishlist
    @wishlist_items = WishlistItem.where("wishlist_id = ?", params[:id])

    render json: @wishlist_items
  end

  # POST /wishlist_items
  def create
    @wishlist_items = WishlistItem.new(wishlist_item_params)
    @wishlist_items_user = current_user
    if @wishlist_items.save
      render json: @wishlist_items, status: :created, location: @wishlist_item
    else
      render json: @wishlist_items.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wishlist_items/1
  def update
    if @wishlist_items.update(wishlist_item_params)
      render json: @wishlist_items
    else
      render json: @wishlist_items.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wishlist_items/1
  def destroy
    @wishlist_items.destroy
  end

  def return_404
    render :json => {:error => "not-found"}.to_json, :status => 404
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist_item
      @wishlist_items = WishlistItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wishlist_item_params
      params.require(:wishlist_item).permit(:book_title, :book_author, :book_publication, :wishlist_id)
    end
end
