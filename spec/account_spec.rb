require 'account'

describe Account do

  let(:transaction_log) {double(:transaction_log, deposit: true)}
  let(:statement) {double :statement}
  subject(:account) {described_class.new(transaction_log, statement)}

  context "#deposit" do
    it "calls the deposit method on the transaction_log" do
      expect(transaction_log).to receive(:deposit)
      account.deposit
    end
  end

  context "#withdrawn" do

  end

end
