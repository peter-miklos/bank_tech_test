# Understands transaction details

class Transaction

  def initialize(amount, balance, type)
    @amount = amount
    @type = type
    @balance = balance
    @date = Time.new
  end

  def amount
    @amount
  end

  def type
    @type
  end

  def date
    @date
  end

  def balance
    @balance
  end

end
