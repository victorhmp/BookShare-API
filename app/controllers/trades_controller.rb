class TradesController < ApiController
  before_action :set_trade, only: [:show, :update]
  before_action :require_login, except: [:index, :show, :show_by_advertisement, :show_by_offer]
  # rescue_from ActiveRecord::RecordNotFound, :with => :return_404

  # GET /trades
  def index
    @trades = Trade.all
    render json: @trades
  end

  # GET /trades/1
  def show
    render json: @trade
  end

  # GET /trades/advertisement/1
  def show_by_advertisement
    @trades = Trade.where("advertisement_id = ?", params[:id])
    render json: @trades
  end

  # GET /trades/offer/1
  def show_by_offer
    @trades = Trade.where("offer_id = ?", params[:id])
    render json: @trades
  end

  # /advertisements/user/my
  def show_mine
    tradeOff = Trade.joins(:offer).where('user_id = ?', current_user.id)
    tradeAdv = Trade.joins(:advertisement).where('user_id = ?', current_user.id)
    render json: {
      tradeOffer: tradeOff,
      tradeAdvertisement: tradeAdv,
      user: current_user
    }
  end

  # POST /trades
  def create
    @trade = Trade.new(trade_params)

    if @trade.save
      render json: @trade, status: :created, location: @trade
    else
      render json: @trade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trades/1
  def update
    if @trade.update(trade_params)
      render json: @trade
    else
      render json: @trade.errors, status: :unprocessable_entity
    end
  end

  # # DELETE /trades/1
  # def destroy
  #   @trade.destroy
  # end

  # def return_404
  #   render :json => {:error => "not-found"}.to_json, :status => 404
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trade_params
      params.require(:trade).permit(:status, :advertisement_id, :offer_id)
    end
end
