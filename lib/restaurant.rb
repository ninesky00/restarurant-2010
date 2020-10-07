class Restaurant
    attr_reader :name, :dishes
    def initialize(opening_time = "11:30", name)
        @opening_time = opening_time
        @name = name 
        @dishes =[]
    end
    # would love to refractor how to break up the time input string so code doesn't look like below
    def opening_time
        opening_time = Time.new(2020, 10, 07, @opening_time[0..1], @opening_time[3..4])
        opening_time.strftime("%k:%M")
    end

    def closing_time(hours)
        closing_time = Time.new(2020, 10, 07, @opening_time) + hours*60*60
        closing_time.strftime("%k:%M")
    end

    def add_dish(dish)
        @dishes << dish
    end

    def open_for_lunch?
        if Time.new(2020, 10, 07, @opening_time[0..1], @opening_time[3..4]) < Time.new(2020, 10, 07, 12) 
            true
        else
            false
        end
    end

    def menu_dish_names
        menu_dish_names =[]
        @dishes.each do |dish|
            menu_dish_names << dish.upcase
        end
        menu_dish_names
    end
    #changed the time format output
    def announce_closing_time(hours)
        closing_time = Time.new(2020, 10, 07, @opening_time) + hours*60*60
        "#@name will be closing at #{closing_time.strftime('%l:%M%p')}"
    end
end