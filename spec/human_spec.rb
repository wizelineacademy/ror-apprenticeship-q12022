require_relative '../enviroment'

RSpec.describe Enviroment do
  context 'with valid human input' do
    it 'instantiates a new human with correct name' do
      human = Enviroment::Human.new(name: 'Human1')
      expect(human.name).to eq 'Human1'
    end
    it 'should have an id' do
      human = Enviroment::Human.new(name: 'Human1')
      expect(human.id).not_to be_empty
    end
    it 'should raise an error if no name is passed' do
      expect { Enviroment::Human.new }.to raise_error(ArgumentError)
    end
  end
  context 'with valid worker input' do
    it 'sets the worker personal data' do
      worker = Enviroment::Worker.new(name: 'Diego')
      worker.set_personal_data(surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx,
                               language: :es)
      expect(worker.personal_data[:surname]).to eq 'Mota'
    end
    it 'sets the worker professional data' do
      worker = Enviroment::Worker.new(name: 'Diego')
      worker.set_professional_data(position: 'SE', occupation: 'IT', skills: %i[ruby blender], observations: 'none')
      expect(worker.professional_data[:skills]).to eq %i[ruby blender]
    end
  end
end
