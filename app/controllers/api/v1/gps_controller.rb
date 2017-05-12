class Api::V1::GpsController < Api::V1::ApplicationController
  before_action :set_gp, only: [:show]

  def show
  end

  def create
    @gp = Gp.new(gp_params)

    respond_to do |format|
      if @gp.save
        format.json { render :show, status: :created, location: @gp }
      else
        format.json { render json: @gp.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gp
      @gp = Gp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gp_params
      params.require(:gp).permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
    end
end
