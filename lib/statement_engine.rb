class StatementEngine

  def initialize
  end

  def print_statement(transaction_log)
    add_header + add_statement_content(transaction_log)
  end

  private

  def add_header
    "date || credit || debit || balance\n"
  end

  def add_statement_content(transaction_log)
    transaction_log.transactions.map do |tr|
      if tr.type == :credit
        "#{tr.date.strftime("%d/%m/%Y")} || #{sprintf('%.2f', tr.amount)} || || #{sprintf('%.2f', tr.balance)}"
      else
        "#{tr.date.strftime("%d/%m/%Y")} || || #{sprintf('%.2f', tr.amount)} || #{sprintf('%.2f', tr.balance)}"
      end
    end.join("\n")
  end

end
