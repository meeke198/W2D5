class Item
    attr_reader :deadline
    attr_accessor :title, :description
    
    def self.valid_date?(date_string)
        parts = date_string.split("-").map {|part| part.to_i}
        year, month, day = parts
        return false if parts.length != 3 
        return false if !(0..12).include?(month)
        return false if !(0..31).include?(day)
        true
    end

    def initialize(title, deadline, description)
        raise "This deadline is invalid!" if !Item.valid_date?(deadline)
        @title = title
        @description = description
        @deadline = deadline   
    end

    def deadline=(new_deadline)
        raise "This deadline is invalid!" if !Item.valid_date?(deadline)
        @deadline = new_deadline
    end

end