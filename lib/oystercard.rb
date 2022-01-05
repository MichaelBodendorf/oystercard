class Oystercard

  attr_reader :balance
  LIMIT = 90

  def initialize

    @balance = 0
    @in_journey = false

  end

  def top_up(value)

    if @balance + value > LIMIT
      raise "Maximum limit of #{LIMIT} has been reached"
    else
      @balance += value
    end

  end

  def deduct(value)
    @balance -= value
  end
  
  def in_journey?
    false
  end 

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
