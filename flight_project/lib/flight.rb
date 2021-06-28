class Flight
    attr_reader :flight_number_string, :capacity
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end
    

    def full?
        if @passengers.length == capacity
            return true
        else
            return false
        end
    end

    def board_passenger(passenger)
        passenger.passengers.full?
    end



end