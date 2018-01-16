module Verizon
  class Home
    include PageObject
    link(:split_the_bill, link_text: 'Splitting the Bill')
    links(:lines, class: 'o-vb-charge-link')
  end
end