class WishlistsController < ApiController
  before_action :require_login, except: [:index, :show]

  def index
    wishlists = Wishlist.all
    render json: { wishlists: wishlists }
  end

  def show
    wishlist = Wishlist.find(params[:id])
    wishlist_user = wishlist.user
    render json: { wishlist: wishlist, username: monster_user.username }
  end

  def create
    wishlist = Wishlist.new(wishlist_params)
    wishlist_user = current_user

    if wishlist.save
      render json: {
        message: 'ok',
        wishlist: wishlist
      }
    else
      render json: {message: 'Could not create wishlist'}
    end
  end

  private
  def wishlist_params
    params.require(:wishlist).permit(:name, :description)
  end

end
