require "./lib/statement"
require "./lib/transaction_log"

class Account

  def initialize(transaction_log = TransactionLog.new, statement = Statement.new)
    @transaction_log = transaction_log
    @statement = statement
  end


end
