require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:tournaments) }
    it { should have_many(:teams).through(:tournaments) }
  end

  before :each do
    @competition = Competition.create!(name: "Women's Individual Gold Medal Match", location: 'Yumenoshima Park', sport: 'Archery')
    @team_1 = Team.create!(hometown: 'Republic of Korea', nickname: 'KOR')
    @player_1 = @team_1.players.create!(name: 'San An', age: 20)
    @team_2 = Team.create!(hometown: 'Russian Federation', nickname: 'ROC')
    @player_2 = @team_2.players.create!(name: 'Elena Osipova', age: 28)
    @competition.teams << @team_1
    @competition.teams << @team_2
  end
  
  describe 'instance methods' do
    describe '#average_age_players' do
      it 'can return the average age of players in competition across teams' do
        expect(@competition.average_age_players).to eq(24)
      end
    end
  end
end
