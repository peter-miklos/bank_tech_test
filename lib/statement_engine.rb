# Understands how to create an account statement

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
    transactions = transaction_log.transactions.sort_by {|tr| tr.date}.reverse
    transactions.map do |tr|
      "#{tr.date.strftime("%d/%m/%Y")} || #{add_credit_amount(tr)}|| #{add_debit_amount(tr)}|| #{sprintf('%.2f', tr.balance)}"
    end.join("\n")
  end

  def add_credit_amount(tr)
    "#{sprintf('%.2f', tr.amount)} " if tr.type == :credit
  end

  def add_debit_amount(tr)
    "#{sprintf('%.2f', tr.amount)} " if tr.type == :debit
  end

end
