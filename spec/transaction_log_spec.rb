require 'transaction_log'

describe TransactionLog do

  let(:transaction) {double :transaction}
  let(:transaction_class) {double(:transaction_class, new: transaction)}
  subject(:transaction_log) {described_class.new(transaction_class)}

  context "#deposit" do
    it "create transaction and add it to transactions" do
      transaction_log.deposit(1000)
      expect(transaction_log.instance_variable_get(:@transactions)).to include(transaction)
    end
  end

  context "#withdraw" do

  end
end
