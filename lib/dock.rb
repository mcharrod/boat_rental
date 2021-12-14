class Dock
  attr_reader :name,
              :max_rental_time,
              :rental_log

  def initialize(name, max_rental_time)
    @name            = name
    @max_rental_time = max_rental_time
    @rental_log      = {}
  end

# take a Boat instance and Renter instance and adds them
# as keys and values to the rental_log hash respectively
  def rent(boat, renter)
    @rental_log[boat] = renter
  end

# takes a Boat instance as an argument and retrieves
# credit_card_number value from rental_log
  def charge(boat)
    hash = {}
    card_info = rental_log[boat].credit_card_number
    rental_price = boat.price_per_hour * boat.hours_rented

    hash[:card_number] = card_info
    hash[:amount] = rental_price
    # must end it with the hash to get the full return,
    # otherwise it will return the last value of the
    # last line!!!
    hash
  end
end
