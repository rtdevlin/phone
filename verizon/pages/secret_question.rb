module Verizon
  class SecretQuestion
    include PageObject
    text_field(:answer, id: 'IDToken1')
    button(:continue, id: 'otherButton')
  end
end
