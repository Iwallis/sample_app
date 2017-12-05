class FlightsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @flight = current_user.flights.build(flight_params)
    if @flight.save
      flash[:success] = "Flight created!"
      redirect_to current_user
    else
      render current_user
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    if current_user == @flight.user
      @flight.destroy
      flash[:success] = "Flight deleted"
      # redirect to the previous url or if there isnt one, go to home page
    else
      flash[:danger] = "you don't own that flight"
    end
    redirect_to request.referrer || root_url
  end

  private

    def flight_params
      params.require(:flight).permit( :date,
                                      :aircraft_type,
                                      :aircraft_ident,
                                      :pic,
                                      :sic,
                                      :day_hours)
    end

end
