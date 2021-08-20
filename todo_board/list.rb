require './item.rb'  #loi khong add duoc new item ma  khong biet vi sao T_T
class List
    LINE_WIDTH = 42
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10 

    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = '')
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        # return false if index < 0 && index > self.size #why self.size here but only size in down method?
        # true
        0 <= index && index < self.size
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end
    
    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def print
        puts "_".ljust(LINE_WIDTH, "_")
        puts " " * 16 + self.label.upcase
        puts "#{"Index".ljust(INDEX_COL_WIDTH)} | #{"Item".ljust(ITEM_COL_WIDTH)} | #{"Deadline".ljust(DEADLINE_COL_WIDTH)}"
        puts "_".ljust(LINE_WIDTH,"_")
        @items.each_with_index do |item, i|
        puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH) }"
        end
        puts "_".ljust(LINE_WIDTH,"_")
    end

    def print_full_item(index)
        return if !valid_index?(index)
        item = @Items[index]
        puts "_".ljust(LINE_WIDTH,"_")
        puts "#{item.tittle.ljust(LINE_WIDTH/2)}#{item.deadline.rjust(LINE_WIDTH/2)}"
        puts "#{item.descriptionp.ljust(ITEM_COL_WIDTH)}"
        puts "_".ljust(LINE_WIDTH,"_")    
    end

    def print_priority
        print_full_item[0]
    end

    def up(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != 0
            swap(index, index - 1)
            index -= 1
            amount -= 1
        end
        true
    end

    def down(index, amount = 1)
        return false if !valid_index?(index)
       while amount > 0 && index != size - 1
            swap(index, index + 1)
            index += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @item.sort_by! {|item| item.deadline}
    end
end