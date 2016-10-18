class StatementEngine

  def initialize
  end

  def print_statement(transaction_log)
    puts add_header + add_statement_content(transaction_log)
  end

  private

  def add_header
    "date || credit || debit || balance\n"
  end

  def add_statement_content(transaction_log)
    transaction_log.transactions.sort_by {|tr| tr.date}.reverse.map do |tr|
      if tr.type == :credit
        "#{tr.date.strftime("%d/%m/%Y")} || #{sprintf('%.2f', tr.amount)} || || #{sprintf('%.2f', tr.balance)}"
      elsif tr.type == :debit
        "#{tr.date.strftime("%d/%m/%Y")} || || #{sprintf('%.2f', tr.amount)} || #{sprintf('%.2f', tr.balance)}"
      end
    end.join("\n")
  end

end
