require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:tournaments) }
    it { should have_many(:competitions).through(:tournaments) }
  end

  before :each do
    @team_1 = Team.create!(hometown: 'Republic of Korea', nickname: 'KOR')
    @player_1 = @team_1.players.create!(name: 'San An', age: 20)
    @team_2 = Team.create!(hometown: 'Russian Federation', nickname: 'ROC')
    @player_2 = @team_2.players.create!(name: 'Elena Osipova', age: 28)

    @team_21 = Team.create!(hometown: 'Italy', nickname: 'ITA')
    @player_21 = @team_21.players.create!(name: 'Mauro Nespoli', age: 33)
    @team_22 = Team.create!(hometown: 'Turkey', nickname: 'TUR')
    @player_22 = @team_22.players.create!(name: 'Mete Gazoz', age: 22)
  end

  describe 'class methods' do
    describe '.order_players_average_age' do
      it 'returns average age of all players' do
        expect(Team.order_players_average_age).to eq([@team_21, @team_2, @team_22, @team_1])
      end
    end
  end
end
