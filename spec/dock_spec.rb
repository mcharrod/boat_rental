require './lib/dock'
require './lib/renter'
require './lib/boat'

RSpec.describe Dock do

  before :each do
    @dock = Dock.new("The Rowing Dock", 3)
  end

  it 'exists' do
    expect(@dock).to be_a(Dock)
  end

  it 'has attributes' do
    expect(@dock.name).to eq("The Rowing Dock")
    expect(@dock.max_rental_time).to eq(3)
  end

  it 'rents out boats' do
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    @dock.rent(kayak_1, patrick)
    @dock.rent(kayak_2, patrick)
    @dock.rent(sup_1, eugene)
    rent_log = {
      kayak_1 => patrick,
      kayak_2 => patrick,
      sup_1   => eugene
    }

    expect(@dock.rental_log).to eq(rent_log)
  end

  it '#charge' do
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    @dock.rent(kayak_1, patrick)
    @dock.rent(kayak_2, patrick)
    @dock.rent(sup_1, eugene)
    kayak_1.add_hour
    kayak_1.add_hour
    charge_hash = {:card_number => "4242424242424242", :amount => 40}
    expect(@dock.charge(kayak_1)).to eq(charge_hash)
    sup_1.add_hour
    charge_hash = {:card_number => "1313131313131313", :amount => 15}
    expect(@dock.charge(sup_1)).to eq(charge_hash)
  end
end
