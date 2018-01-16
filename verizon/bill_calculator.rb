module Verizon
  class BillCalculator
    attr_accessor :lines, :account
    class << self
      def get_bill account
        calculator = self.new account
        calculator.lines = account.lines
        calculator.sign_in
        calculator.answer_secret_question if $browser.title == 'Verizon Secret Question'
        calculator.parse_bill
      end

    end

    def initialize account
      @account = account
      @lines = []
    end

    def parse_bill
      $browser.goto 'https://nbillpay.verizonwireless.com/vzw/accountholder/mybill/mybill.action#/'
      page = Verizon::Home.new($browser)
      page.split_the_bill_element.focus
      sleep 10
      page.split_the_bill
      bill = []
      page.lines_elements.drop(1).each do |line|
        bill << {
           number: line.span_elements[1].text.gsub('-', '').to_i,
           due: line.span_elements[2].text.gsub('$', '').to_f
        }
      end
      bill
    end
    def answer_secret_question
      page = Verizon::SecretQuestion.new($browser)
      page.answer = 'SECRET ANSWER HERE'
      page.continue
    end

    def sign_in
      page = Verizon::SignIn.new($browser)
      $browser.goto 'https://www.verizonwireless.com/my-verizon/'
      page.number = account.main_line.number
      page.password = 'PASSWORD HERE'
      page.sign_in
    end
  end
end
