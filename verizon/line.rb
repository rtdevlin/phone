module Verizon
  class Line
    attr_accessor :name, :number, :data, :due
    def initialize(name:, number:, data: true)
      @name = name
      @number = number
      @data = data
    end
    def data_line?
      data
    end
  end
end
