require "./lib/statement"
require "./lib/transaction_log"

class Account

  OPENING_BALANCE = 0;

  def initialize(transaction_log: TransactionLog.new, statement: Statement.new, opening_balance: OPENING_BALANCE)
    @transaction_log = transaction_log
    @statement = statement
    @balance = opening_balance
  end

  def deposit(amount)
    @transaction_log.deposit(amount)
  end

  def withdraw(amount)
    @transaction_log.withdraw(amount)
  end

  def print_statement()

  end


end
