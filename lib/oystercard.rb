class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90
  MIN_BALANCE = 1 
  MIN_FARE = 1

  def initialize

    @balance = 0
    @in_journey = false

  end

  def top_up(value)
    raise "Maximum limit of #{MAX_BALANCE} has been reached" if @balance + value > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    @in_journey
  end 

  def touch_in
    raise "Your balance is less than #{MIN_BALANCE}" if @balance < MIN_BALANCE
    @in_journey = true  
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  private

  def deduct(value)
    @balance -= value
  end
  
end
