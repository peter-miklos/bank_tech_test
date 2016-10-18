require 'statement_engine'

describe StatementEngine do

  subject(:statement_engine) {described_class.new}
  let(:transaction1) {double(:transaction1, amount: 1000, type: :deposit, date: Time.new(2016, 10, 13))}
  let(:transaction2) {double(:transaction2, amount: 500, type: :withdraw, date: Time.new(2016, 10, 17))}
  let(:transaction_log) {double(:transaction_log, transactionts: [transaction1, transaction2])}

  context "#print_statement" do
    it "prints out the statement with header" do
      result = "date || credit || debit || balance\n13/10/2016 || 1000.00 || || 1000.00\n17/10/2016 || || 500.00 || 500.00"
      expect(statement_engine.print_statement(transaction_log)).to eq result
    end
  end
end
