class OffersController < ApiController
  before_action :require_login, except: [:index, :show, :show_by_advertisement, :show_by_user]
  rescue_from ActiveRecord::RecordNotFound, :with => :return_404

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
                  username: offer_user.username,
                 }
  end

  # /offers/user/my
  def show_mine
    offer = Offer.includes(:advertisement).where(user: current_user).order(:status)

    # render json: offer.to_json(:include => :advertisement
    render json: offer.as_json(
        include: {
          advertisement: {
            include: { 
              user: {
                only: :username
              }
            }
          }
        }
    )
  end

  # GET /offers/user/1
  def show_by_user
    @offers = Offer.where("user_id = ?", params[:id])
    render json: @offers
  end

  # GET /offers/advertisement/1
  def show_by_advertisement
    @offers = Offer.where("advertisement_id = ?", params[:id])
    render json: @offers
  end

  # POST /offers/cancel
  def cancel
    offer = Offer.find(params[:id])
    if current_user == offer.user
      if offer.cancelled!
        render json: {
          message: 'Cancelled succesfully',
          offer: offer
        }, status => 200
      else
        render json: {
          message: 'Could not save to database',
          offer: offer
        }, status => 500
      end

    else
      render json: {
          message: 'Unauthorized',
          offer: offer
        }, status => 401
    end
  end

  # POST /offers/decline
  def decline
    offer = Offer.find(params[:id])
    # only the advertisement owner can decline the offer
    if current_user == offer.advertisement.user
      if offer.declined!
        render json: {
          message: 'Declined succesfully',
          offer: offer
        }, status => 200
      else
        render json: {
          message: 'Could not save to database',
          offer: offer
        }, status => 500
      end

    else
      render json: {
          message: 'Unauthorized',
          offer: offer
        }, status => 401
    end
  end

  # POST /offers/accept
  def accept
    offer = Offer.includes(:advertisement).find(params[:id])
    # only the advertisement owner can accept the offer
    if current_user == offer.advertisement.user
      if offer.accepted!
        # decline other offers
        offer.advertisement.offer.each do |o|
          if o.id != offer.id
            o.declined!
          end
        end

        # close advertisement
        offer.advertisement.closed!

        # create trade
        trade = Trade.new
        trade.status = 0
        trade.offer = offer
        trade.advertisement = offer.advertisement
        trade.save!

        render json: offer.as_json(include:{advertisement:{include:{user:{only: :username}}}}), status => 200
      else
        render json: offer.as_json(include:{advertisement:{include:{user:{only: :username}}}}), status => 500
      end

    else
      render json: offer.as_json(include:{advertisement:{include:{user:{only: :username}}}}), status => 401
    end
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
  # def destroy
  #   offer = Offer.find(params[:id])
  #   offer.destroy
  # end

  def return_404
    render :json => {:error => "not-found"}.to_json, :status => 404
  end

  private
    # Only allow a trusted parameter "white list" through.
    def offer_params
      params.require(:offer).permit(:book_title, :book_author, :book_publication, :comment, :advertisement_id, :status)
    end
end
