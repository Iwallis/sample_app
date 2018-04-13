class FlightsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @user = current_user
    @flight = current_user.flights.build(flight_params)
    @flights = current_user.flights.paginate(page: params[:page], :per_page => 15)
    if @flight.save
      flash[:success] = "Flight created!"
      redirect_to current_user
    else
      render 'users/show'
    end
  end

  def action
    this_is_a_test
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
                                      :day_hours,
                                      :night_hours,
                                      :is_dual,
                                      :is_single_engine,
                                      :is_xc,
                                      :hood_hours,
                                      :imc_hours,
                                      :sim_hours,
                                      :route,
                                      :comments)
    end

end
