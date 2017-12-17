module FlightsHelper

  def set_attr(attribute, list, flights)
    if attribute != 'date'
      count = 0
      for i in list do
        flights[count].attribute = i
      end
      return flights
    else
      flights = []
      for date in dates do
        f = Flight.new
        f.date = date
        flights << f
      end
      return flights
    end
  end

  def this_is_a_test
    console.puts('this is a test!')
  end
end
