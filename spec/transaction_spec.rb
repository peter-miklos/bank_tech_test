require 'transaction'

describe Transaction do

  subject(:deposit_tr) {described_class.new(1000, :deposit)}
  subject(:withdraw_tr) {described_class.new(500, :withdraw)}

  context "#amount" do
    it "returns the deposit amount" do
      expect(deposit_tr.amount).to eq 1000
    end

    it "returns the withdrawal amount" do
      expect(withdraw_tr.amount).to eq 500
    end
  end

  context "#type" do

  end

  context "#date" do

  end
end
