class WishlistsController < ApiController
  before_action :require_login, except: [:index, :show]
  rescue_from ActiveRecord::RecordNotFound, :with => :return_404

  def index
    wishlists = Wishlist.all
    render json: { wishlists: wishlists }
  end

  def show
    wishlist = Wishlist.find(params[:id])
    wishlist_user = wishlist.user
    render json: { wishlist: wishlist, username: monster_user.username }
  end

  # GET /wishlists/user/1
  def show_by_user
    @wishlists = Wishlist.where("user_id = ?", params[:id])

    render json: @wishlists
  end

  def create  
    wishlist = Wishlist.new(wishlist_params)
    wishlist.user = current_user    
    if wishlist.save
      render json: {
        message: 'ok',
        wishlist: wishlist
      }
    else
      render json: {message: 'Could not create wishlist'}
    end
  end

  def update
    wishlist = Wishlist.find(params[:id])
    wishlist.user = current_user
    if wishlist.update(wishlist_params)
      #redirect_to wishlist
      render json: {message: 'ok', wishlist: wishlist}
    else
      render json: {message: 'Could not update wishlist'}
    end
  end

  def destroy
    wishlist = Wishlist.find(params[:id])
    wishlist.destroy
  end

  def return_404
    render :json => {:error => "not-found"}.to_json, :status => 404
  end

  private
  def wishlist_params
    params.require(:wishlist).permit(:name, :description)
  end

end
