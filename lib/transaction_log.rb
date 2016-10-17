class TransactionLog

  def initialize(transaction_class = Transaction)
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount)
    @transactions.push(create_transaction(amount, "deposit"))
  end


  private

  def create_transaction(amount, type)
    @transaction_class.new(amount, type)
  end

end
