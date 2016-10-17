require "./lib/statement"
require "./lib/transaction_log"

class Account

  def initialize(transaction_log = TransactionLog.new, statement = Statement.new)
    @transaction_log = transaction_log
    @statement = statement
  end

  def deposit(amount)
    @transaction_log.deposit(amount)
  end

  def withdraw(amount)
    @transaction_log.withdraw(amount)
  end

  def print_statement
  end


end
