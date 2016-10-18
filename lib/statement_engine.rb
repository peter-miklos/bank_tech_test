class StatementEngine

  def initialize
  end

  def print_statement(transactions)
    puts add_header
    # add_statement_content(transactions)
  end

  private

  def add_header
    "date || credit || debit || balance\n"
  end

  def add_statement_content(transactions)
    transactions.each do |transaction|
      # add code here
    end.join("\n")
  end

end
