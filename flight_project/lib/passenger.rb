
class Passenger
    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers  = []
    end

    def has_flight?(flight_number_string)
        # debugger
        if @flight_numbers.include?(flight_number_string.upcase)
            return true
        else
            false
        end
    end

    def add_flight(flight_number_string)
        if !self.has_flight?(flight_number_string)
            @flight_numbers << flight_number_string.upcase
        end

    end
end
