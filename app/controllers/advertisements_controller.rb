class AdvertisementsController < ApiController
  before_action :require_login, except: [:index, :show]
  rescue_from ActiveRecord::RecordNotFound, :with => :return_404

  def index
    advertisement = Advertisement.all    
    render json: {advertisement: advertisement}
  end

  def show
    advertisement = Advertisement.find(params[:id])
    advertisement_user = advertisement.user
    render json: {advertisement: advertisement, 
                  username: monster_user.username,
                 }
  end

  # GET /advertisements/user/1
  def show_by_user
    @advertisements = Advertisement.where("user_id = ?", params[:id])
    render json: @advertisements
  end

  # POST /advertisements
  def create
    
    advertisement = Advertisement.new(advertisement_params)
    advertisement.user = current_user
    if advertisement.save
      render json: {
        message: 'ok',
        advertisement: advertisement
      }
    else
      render json: {message: 'Could not create advertisement'}
    end
  end

  # PATCH/PUT /advertisements/1
  def update
    advertisement = Advertisement.find(params[:id])
    advertisement.user = current_user
    if advertisement.update(advertisement_params)
      render json: {message:'ok', advertisement: advertisement}
    else
      render json: {message: 'Could not update advertisement'}
    end
  end

  # DELETE /advertisements/1
  # def destroy
  #   advertisement = Advertisement.find(params[:id])
  #   advertisement.destroy
  # end

  def return_404
    render :json => {:error => "not-found"}.to_json, :status => 404
  end

  private
    def advertisement_params
      params.require(:advertisement).permit(:book_title, :book_author, :book_publication, :comment, :status)
    end
end
