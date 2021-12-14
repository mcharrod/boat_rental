require './lib/boat.rb'
require './lib/dock.rb'
require './lib/renter.rb'

RSpec.describe Boat do

  before :each do
    @kayak = Boat.new(:kayak, 20)
  end


  it 'exist' do
    expect(@kayak).to be_a(Boat)
  end

  it 'has attributes' do
    expect(@kayak.type).to eq(:kayak)
    expect(@kayak.price_per_hour).to eq(20)
    expect(@kayak.hours_rented).to eq(0)
  end

  it '#add_hour' do
    @kayak.add_hour
    @kayak.add_hour
    @kayak.add_hour
    expect(@kayak.hours_rented).to eq(3)
  end
end
