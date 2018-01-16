require './verizon/line'
describe Verizon::Line do
  let(:line){described_class.new(name: 'Bob', number: 1234567890)}

  context '#name' do
    it 'will return name' do
      expect(line.name).to eq 'Bob'
    end
  end
  context '#number' do
    it 'will return number' do
      expect(line.number).to eq 1234567890
    end
  end
  context '#data' do
    it 'will return data' do
      expect(line.data).to be true
    end
  end
end
