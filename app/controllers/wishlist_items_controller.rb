class WishlistItemsController < ApplicationController
  before_action :set_wishlist_item, only: [:show, :update, :destroy]

  # GET /wishlist_items
  def index
    @wishlist_items = WishlistItem.all

    render json: @wishlist_items
  end

  # GET /wishlist_items/1
  def show
    render json: @wishlist_item
  end

  # GET /wishlist_items/wishlist/1
  def show_by_wishlist
    @wishlist_items = WishlistItem.where("wishlist_id = ?", params[:id])

    render json: @wishlist_items
  end

  # POST /wishlist_items
  def create
    @wishlist_item = WishlistItem.new(wishlist_item_params)

    if @wishlist_item.save
      render json: @wishlist_item, status: :created, location: @wishlist_item
    else
      render json: @wishlist_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wishlist_items/1
  def update
    if @wishlist_item.update(wishlist_item_params)
      render json: @wishlist_item
    else
      render json: @wishlist_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wishlist_items/1
  def destroy
    @wishlist_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist_item
      @wishlist_item = WishlistItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wishlist_item_params
      params.require(:wishlist_item).permit(:book_title, :book_author, :book_publication, :wishlist_id)
    end
end
