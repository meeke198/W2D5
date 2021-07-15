class Flight
    attr_reader :flight_number, :capacity #tai sao trong dap an chi set passenger nhung van pass all spec, con file minh y chang ma ko khai flight_number, capacity laf khong chay duoc.
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
     if passenger.has_flight?(@flight_number) && !self.full? #tai sao passenger la Passenger instance ma khong phai la passenger.flight_number trong ngoac la arg ma lai xai flight_number duoc luon?
        @passengers << passenger
     end
    end

    def list_passengers
        @passengers.map {|passenger| passenger.name}
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end