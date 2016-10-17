require 'account'

describe Account do

  let(:transaction_log) {double(:transaction_log, deposit: true, withdraw: true)}
  let(:statement) {double :statement}
  subject(:account1) {described_class.new(transaction_log: transaction_log, statement: statement)}
  subject(:account2) {described_class.new(transaction_log: transaction_log, statement: statement, opening_balance: 10)}

  context "balance" do
    it "starts with 0 as opening balance if account instantiated w/o opening balance" do
      expect(account1.instance_variable_get(:@balance)).to eq 0
    end

    it "starts with 10 as opening balance if account instantiated with 10 opening balance" do
      expect(account2.instance_variable_get(:@balance)).to eq 10
    end
  end

  context "#deposit" do
    it "calls the deposit method on the transaction_log" do
      expect(transaction_log).to receive(:deposit)
      account1.deposit(1000)
    end

    it "adds the amount to the current balance" do
      account1.deposit(1000)
      expect(account1.instance_variable_get(:@balance)).to eq 1000
    end
  end

  context "#withdrawn" do
    it "calls the withdraw method on the transaction_log" do
      expect(transaction_log).to receive(:withdraw)
      account1.withdraw(1000)
    end

    it "deducts the amount from the current balance" do
      account2.withdraw(5)
      expect(account2.instance_variable_get(:@balance)).to eq 5
    end
  end

  context "#print_statement" do

  end

end
