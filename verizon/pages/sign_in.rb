module Verizon
  class SignIn
    include PageObject
    in_iframe(src: 'https://login.verizonwireless.com/amserver/UI/Login?userNameOnly=false&mode=i&realm=vzw') do |frame|
      text_field(:number, id: 'IDToken1', frame: frame)
      text_field(:password, id: 'IDToken2', frame: frame)
      button(:sign_in, id: 'login-submit', frame: frame)
    end
  end
end