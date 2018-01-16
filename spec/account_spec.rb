require './verizon/account'
describe Verizon::Account do
	before(:all) do 
		@account = described_class.new
		@account.add_main_line({name: 'bob', number: 123})
		@account.add_line({name: 'Ryan', number: 456})
    @account.add_data_plan_price 110.00
	end

	context '#add_main_line' do
		it 'will add the line to the lines array and set the main variable' do
			expect(@account.main_line).to eq({name: 'bob', number: 123})
			expect(@account.lines).to include({name: 'bob', number: 123})
		end
	end

	context '#add_line' do
		it 'will add the line to the line array' do 
			expect(@account.lines).to include({name: 'Ryan', number: 456})
		end
  end

  context '#add_data_plan_price' do
    it 'will add the price of the data plan' do
      expect(@account.data_price).to eq 110.00
    end
  end
end

