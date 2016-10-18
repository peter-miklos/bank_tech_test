require 'statement_engine'

describe StatementEngine do

  subject(:statement_engine) {described_class.new}
  let(:transaction1) {double(:transaction1, amount: 1000, type: :credit, date: Time.new(2016, 10, 13), balance: 1200)}
  let(:transaction2) {double(:transaction2, amount: 500, type: :debit, date: Time.new(2016, 10, 17), balance: 700)}
  let(:transaction_log) {double(:transaction_log, transactions: [transaction1, transaction2])}

  context "#print_statement" do
    it "prints out the statement with header" do
      result = "date || credit || debit || balance\n17/10/2016 || || 500.00 || 700.00\n13/10/2016 || 1000.00 || || 1200.00"
      expect(STDOUT).to receive(:puts).with(result)
      statement_engine.print_statement(transaction_log)
    end
  end
end
