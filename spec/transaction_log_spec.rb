require 'transaction_log'

describe TransactionLog do

  let(:transaction) {double :transaction}
  let(:transaction_class) {double(:transaction_class, new: transaction)}
  subject(:transaction_log) {described_class.new(transaction_class)}

  context "#deposit" do
    it "create credit transaction and add it to transactions array" do
      transaction_log.deposit(1000, 1200)
      expect(transaction_log.instance_variable_get(:@transactions)).to include(transaction)
    end

    it "raises error if amount is not an integer" do
      expect {transaction_log.deposit("300", 200)}.to raise_error(RuntimeError)
    end

    it "raises error if amount < 1" do
      expect {transaction_log.deposit(0, 200)}.to raise_error(RuntimeError)
    end

  end

  context "#withdraw" do
    it "creates debit transaction and add it to transactions array" do
      transaction_log.withdraw(1000, 200)
      expect(transaction_log.instance_variable_get(:@transactions)).to include(transaction)
    end

    it "raises error if amount is not an integer" do
      expect {transaction_log.withdraw("300", 200)}.to raise_error(RuntimeError)
    end

    it "raises error if amount < 1" do
      expect {transaction_log.withdraw(0, 200)}.to raise_error(RuntimeError)
    end

    it "raises error if the new_balance < 0" do
      expect {transaction_log.withdraw(300, -200)}.to raise_error(RuntimeError)
    end
  end

  context "#transactions" do
    it "returns the array of transactions" do
      transaction_log.deposit(1000, 1200)
      expect(transaction_log.transactions).to eq [transaction]
    end
  end
end
