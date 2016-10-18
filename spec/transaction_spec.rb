require 'transaction'

describe Transaction do

  subject(:deposit_tr) {described_class.new(1000, 1200, :deposit)}
  subject(:withdraw_tr) {described_class.new(500, 700, :withdraw)}

  context "#amount" do
    it "returns the deposit amount" do
      expect(deposit_tr.amount).to eq 1000
    end

    it "returns the withdrawal amount" do
      expect(withdraw_tr.amount).to eq 500
    end
  end

  context "#type" do
    it "returns the type of a deposit transaction" do
      expect(deposit_tr.type).to eq :deposit
    end

    it "returns the type of a withdraw transaction" do
      expect(withdraw_tr.type).to eq :withdraw
    end
  end

  context "#date" do

    before do
      @current_date = Time.new.strftime("%F")
    end

    it "returns the date of deposit transaction" do
      expect(deposit_tr.date.strftime("%F")).to eq @current_date
    end

    it "returns the date of the withdraw transaction" do
      expect(withdraw_tr.date.strftime("%F")).to eq @current_date
    end
  end

  context "#balance" do
    it "returns the balance after the credit transaction is created" do
      expect(deposit_tr.balance).to eq 1200
    end

    it "returns the balance after the debit transaction is created" do
      expect(withdraw_tr.balance).to eq 700
    end


  end
end
