class FlightsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @flight = current_user.flights.build(flight_params)
    if @flight.save
      flash[:success] = "Flight created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
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
