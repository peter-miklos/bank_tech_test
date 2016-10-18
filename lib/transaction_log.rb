require './lib/transaction'

class TransactionLog

  def initialize(transaction_class = Transaction)
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount, new_balance)
    @transactions << create_transaction(amount, new_balance, :deposit)
  end

  def withdraw(amount, new_balance)
    @transactions << create_transaction(amount, new_balance, :withdraw)
  end

  private

  def create_transaction(amount, new_balance, type)
    @transaction_class.new(amount, new_balance, type)
  end

end
