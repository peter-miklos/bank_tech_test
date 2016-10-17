require 'account'

describe Account do

  let(:transaction_log) {double(:transaction_log, deposit: true)}
  let(:statement) {double :statement}
  subject(:account) {described_class.new(transaction_log, statement)}

  context "#deposit" do
    it "calls the deposit method on the transaction_log" do
      expect(transaction_log).to receive(:deposit)
      account.deposit(1000)
    end
  end

  context "#withdrawn" do
    it "calls the withdraw method on the transaction_log" do
      expect(transaction_log).to receive(:withdraw)
      account.withdraw(1000)
    end
  end

  context "#print_statement" do
    
  end

end
