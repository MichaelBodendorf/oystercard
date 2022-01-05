class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90
  MIN_BALANCE = 1 

  def initialize

    @balance = 0
    @in_journey = false

  end

  def top_up(value)

    if @balance + value > MAX_BALANCE
      raise "Maximum limit of #{MAX_BALANCE} has been reached"
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
    if @balance < MIN_BALANCE
      raise "Your balance is less than #{MIN_BALANCE}"
    else
      @in_journey = true
    end
    
  end

  # def touch_out
  #   @in_journey = false
  # end
end
