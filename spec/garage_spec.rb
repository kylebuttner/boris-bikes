require 'garage'

describe Garage do
  it {expect(subject).to respond_to(:accept).with(1).argument }
  it {expect(subject).to respond_to :release}
  it {expect(subject).to respond_to :bikes}
  it {expect(subject).to respond_to :fix!}

it 'accepts a bike' do
  bike = double(:bike)
  # allow(bike).to receive(:working?).and_return(true)
  subject.accept(bike)
  expect(subject.bikes.last).to eq bike
end

it 'fixes all the bikes' do
  bikes =[]
  20.times { bikes << Bike.new }
  bikes.each{|bike| bike.working = false }
  bikes.each {|bike| subject.accept(bike)}
  subject.fix!
  expect(subject.bikes).to all (be_working)


end



# let(:broken_bike){double(:bike)}
# it 'fixes all the bikes' do
#   allow(broken_bike).to receive(:working?).and_return(false)
#
#
#   20.times{subject.accept(broken_bike)}
#   allow(broken_bike).to receive(:working=)
#   subject.fix!
#   #allow(broken_bike).to receive(:working?).and_return(true)
#   expect(subject.bikes).to all (be_working)
#
#
# end


end
