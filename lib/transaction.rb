# Understands transaction details

class Transaction

  def initialize(amount, type)
    @amount = amount
    @type = type
    @date = Date.new
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

end
