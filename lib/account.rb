require "./lib/statement_engine"
require "./lib/transaction_log"

class Account

  OPENING_BALANCE = 0;

  def initialize(transaction_log: TransactionLog.new, statement_engine: StatementEngine.new, opening_balance: OPENING_BALANCE)
    @transaction_log = transaction_log
    @statement_engine = statement_engine
    @balance = opening_balance
  end

  def deposit(amount)
    @transaction_log.deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @transaction_log.withdraw(amount)
    @balance -= amount
  end

  def print_statement
    @statement_engine.print_statement(@transaction_log)
  end
end
