# Understands how to manage transactions
require './lib/transaction'

class TransactionLog

  def initialize(transaction_class = Transaction)
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount, new_balance)
    validate_params(amount, new_balance)
    @transactions << create_transaction(amount, new_balance, :credit)
  end

  def withdraw(amount, new_balance)
    validate_params(amount, new_balance)
    @transactions << create_transaction(amount, new_balance, :debit)
  end

  def get_transactions
    @transactions.dup
  end

  private

  def create_transaction(amount, new_balance, type)
    @transaction_class.new(amount, new_balance, type)
  end

  def validate_params(amount, new_balance)
    raise "Transaction value must be a number" unless amount.class == Fixnum || amount.class == Float
    raise "Transaction value must be higher than zero" unless amount > 0
    raise "Balance cannot be negative" unless new_balance >= 0
  end

end
