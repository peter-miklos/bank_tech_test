# Understands how to manage transactions
require './lib/transaction'

class TransactionLog

  def initialize(transaction_class = Transaction)
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount, new_balance)
    @transactions << create_transaction(amount, new_balance, :credit)
  end

  def withdraw(amount, new_balance)
    @transactions << create_transaction(amount, new_balance, :debit)
  end

  def transactions
    @transactions
  end

  private

  def create_transaction(amount, new_balance, type)
    @transaction_class.new(amount, new_balance, type)
  end

end
