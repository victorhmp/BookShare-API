class OffersController < ApiController
  before_action :require_login, except: [:index, :show]

  # GET /offers
  def index
    offer = Offer.all
    render json: {offer: offer}
  end

  # GET /offers/1
  def show
    offer = Offer.find(params[:id])
    offer_user = offer.user
    render json: {offer: offer, 
                  username: monster_user.username,
                 }
  end

  # POST /offers
  def create
    offer = Offer.new(offer_params)
    offer.user = current_user
    if offer.save
      render json: {
        message: 'ok',
        offer: offer
      }
    else
      render json: {message: 'Could not create offer'}
    end
  end

  # PATCH/PUT /offers/1
  def update
    offer = Offer.find(params[:id])
    offer.user = current_user
    if offer.update(offer_params)
      render json: {message:'ok', offer: offer}
    else
      render json: {message:'Could not update offer'}
    end
  end

  # DELETE /offers/1
  def destroy
    offer = Offer.find(params[:id])
    offer.destroy
  end

  private
    # Only allow a trusted parameter "white list" through.
    def offer_params
      params.require(:offer).permit(:book_title, :book_author, :book_publication, :comment, :advertisement_id, :status)
    end
end
