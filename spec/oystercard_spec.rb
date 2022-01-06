require "oystercard"

describe Oystercard do

  it "is able to store the customers balance" do
    
    expect(subject.balance).to eq 0

  end

  it "responds to top_up method" do
    expect(subject).to respond_to(:top_up).with(1).argument

  end

  it "increases the balance by the top up value" do
    expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
    # expect(subject.top_up(5)).to eq 5
  end

  it "maximum limit reached" do
    expect{ subject.top_up(100) }.to raise_error "Maximum limit of #{Oystercard::MAX_BALANCE} has been reached"
  end

  it "fare deducted from my card" do
    subject.top_up(20)
    expect{ subject.deduct 1 }.to change{subject.balance}.by -1
  end

  it "is not in a journey" do
    expect(subject).not_to be_in_journey
  end

  it "raise an error if not enough on card" do
    expect { subject.touch_in }.to raise_error "Your balance is less than #{Oystercard::MIN_BALANCE}"
  end

  describe "Touch In/Out" do
    it "can touch in" do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end
  
    it "can touch out" do
      subject.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
