require 'page-object'
require 'page-object/page_factory'
require_relative 'verizon/account'
require_relative 'verizon/line'
require_relative 'verizon/bill_calculator'
require_relative 'verizon/pages/sign_in'
require_relative 'verizon/pages/secret_question'
require_relative 'verizon/pages/home'

$browser = Watir::Browser.new(:chrome)
