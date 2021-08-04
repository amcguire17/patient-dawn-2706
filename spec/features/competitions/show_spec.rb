require 'rails_helper'

RSpec.describe 'Competition Show Page' do
  before :each do
    @competition = Competition.create!(name: "Women's Individual Gold Medal Match", location: 'Yumenoshima Park', sport: 'Archery')
    @team_1 = Team.create!(hometown: 'Republic of Korea', nickname: 'KOR')
    @player_1 = @team_1.players.create!(name: 'San An', age: 20)
    @team_2 = Team.create!(hometown: 'Russian Federation', nickname: 'ROC')
    @player_2 = @team_2.players.create!(name: 'Elena Osipova', age: 28)
    @competition.teams << @team_1
    @competition.teams << @team_2

    @competition_2 = Competition.create!(name: "Men's Individual Gold Medal Match", location: 'Yumenoshima Park', sport: 'Archery')
    @team_21 = Team.create!(hometown: 'Italy', nickname: 'ITA')
    @player_21 = @team_21.players.create!(name: 'Mauro Nespoli', age: 33)
    @team_22 = Team.create!(hometown: 'Turkey', nickname: 'TUR')
    @player_22 = @team_22.players.create!(name: 'Mete Gazoz', age: 22)
    @competition_2.teams << @team_21
    @competition_2.teams << @team_22

    visit "/competitions/#{@competition.id}"
  end
  describe 'Competition Name and Attributes' do
    it 'shows the name of the competition and attributes' do
      expect(page).to have_content(@competition.name)
      expect(page).to have_content(@competition.location)
      expect(page).to have_content(@competition.sport)

      expect(page).to_not have_content(@competition_2.name)
    end
  end

  describe 'Competition Teams' do
    it 'shows a list of all the competitions teams and attributes' do
      expect(page).to have_content(@team_1.hometown)
      expect(page).to have_content(@team_1.nickname)
      expect(page).to have_content(@team_2.hometown)
      expect(page).to have_content(@team_2.nickname)

      expect(page).to_not have_content(@team_21.hometown)
      expect(page).to_not have_content(@team_21.nickname)
      expect(page).to_not have_content(@team_22.hometown)
      expect(page).to_not have_content(@team_22.nickname)
    end
    it 'shows the average age of all players in competition' do
      expect(page).to have_content("Average Age of Players: #{@competition.average_age_players}")
      expect(page).to_not have_content("Average Age of Players: #{@competition_2.average_age_players}")
    end
  end

  describe 'Register New Team' do
    it 'has link to add a new team to competition' do
      expect(page).to have_link('Register New Team')
      click_link 'Register New Team'
      expect(current_path).to eq("/competitions/#{@competition.id}/teams/new")
    end
  end
end
