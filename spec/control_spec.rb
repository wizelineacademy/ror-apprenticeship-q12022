require_relative '../enviroment'

RSpec.describe Enviroment do
  context 'with valid inputs' do
    it 'creates a new mission with correct objective' do
      control = Enviroment::Control.new
      control.new_mission(name: :alpha, objective: 'Get alpha to base', pack: :simple_transportation_pack)
      expect(control.missions[:alpha][:objective]).to eq 'Get alpha to base'
    end
    it 'adds a mission to missions array' do
      control = Enviroment::Control.new
      control.new_mission(name: :alpha, objective: 'Get alpha to base', pack: :simple_transportation_pack)
      expect(control.missions.size).to eq 1
    end
    it 'changes the mission status' do
      control = Enviroment::Control.new
      control.new_mission(name: :alpha, objective: 'Get alpha to base', pack: :simple_transportation_pack)
      control.set_mission_to_paused(:alpha)
      expect(control.missions[:alpha][:status]).to eq :paused
    end
  end
end
