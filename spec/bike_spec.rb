require 'bike'


describe Bike do
	it { expect(subject).to respond_to :working }
	it { expect(subject).to respond_to(:working=).with(1).argument}


	# it 'expects bikes to be working' do
	# 	expect(subject.working).to eq true
	# end
	it 'expects bikes to return their operational status if it works' do
		status = true
		subject.working = status
		expect(subject.working).to eq status
	end
	it 'expects bikes to return their operational status if it is broken' do
		status = false
		bike = Bike.new
		bike.working = status
		expect(bike.working).to eq status
	end

end
