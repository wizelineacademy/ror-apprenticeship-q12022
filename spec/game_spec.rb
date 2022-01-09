require_relative '../game'

RSpec.describe Game do
  context 'with valid inputs' do
    game = Game.new
    diego = game.new_worker name: 'Diego'
    diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx,
                            language: :es
    diego.set_professional_data position: 'SE', occupation: 'IT', skills: %i[ruby blender], observations: 'none'
    it 'has the correct name' do
      expect(diego.name).to eq 'Diego'
    end
    it 'has the correct personal data' do
      expect(diego.personal_data[:surname]).to eq 'Mota'
    end
  end
end
