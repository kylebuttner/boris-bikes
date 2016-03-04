require 'van'

describe Van do

  it 'should take broken(or non broken) bikes when told' do
    good_bike = double(:good_bike, working: true)
    broken_bike = double(:broken_bike, working: false)
    station = double(:station, bikes: [good_bike, broken_bike])
    subject.load(station, true)
    expect(subject.bikes).to eq([broken_bike])
  end

end
