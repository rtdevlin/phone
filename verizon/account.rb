module Verizon
	class Account
		attr_accessor :lines, :main_line, :data_price

		def initialize
			@lines = []
		end


		def add_main_line line
			@main_line = line
			add_line line
		end

		def add_line line
			lines << line
		end

		def add_data_plan_price price
			@data_price = price
		end

		def per_line_data_price
			price = data_price / (lines.count{|line| line.data})
			price.round(2)
		end

		def add_bill_to_line bill
			bill.each do |bill_line|
				current_line = lines.select{|line| line.number == bill_line[:number]}.first
				current_line.due = bill_line[:due]
				current_line.due += per_line_data_price if current_line.data_line?
			end
		end
	end
end
