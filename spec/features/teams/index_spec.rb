require 'rails_helper'

RSpec.describe 'Teams Index page' do
  before :each do
    @team_1 = Team.create!(hometown: 'Argentina', nickname: 'ARG')
    @player_1 = @team_1.players.create!(name: 'Agustina Albertarrio', age: 28)
    @player_2 = @team_1.players.create!(name: 'Tomas Belmonte', age: 23)

    @team_2 = Team.create!(hometown: 'Samoa', nickname: 'SAM')
    @player_3 = @team_2.players.create!(name: 'Anne Cairns', age: 40)
    @player_4 = @team_2.players.create!(name: 'Rudolf Williams', age: 42)

    @team_3 = Team.create!(hometown: 'Italy', nickname: 'ITA')
    @player_5 = @team_3.players.create!(name: 'Mauro Nespoli', age: 33)
    @player_6 = @team_3.players.create!(name: 'Matteo Aicardi', age: 35)

    @team_4 = Team.create!(hometown: 'Mexico', nickname: 'MEX')
    @player_7 = @team_4.players.create!(name: 'Eduardo Aguirre', age: 23)
    @player_8 = @team_4.players.create!(name: 'Maunel Barreda', age: 32)

    visit "/teams"
  end
  it 'can see teams and all attributes' do
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_3.nickname)
    expect(page).to have_content(@team_4.nickname)
  end

  it 'list ordered by average of players and can see average age' do
    expect(@team_2.nickname).to appear_before(@team_3.nickname)
    expect(@team_3.nickname).to appear_before(@team_4.nickname)
    expect(@team_4.nickname).to appear_before(@team_1.nickname)
    save_and_open_page

     within("#team-#{@team_1.id}") do
      expect(page).to have_content("Players Average Age: 25.5")
     end

     within("#team-#{@team_2.id}") do
      expect(page).to have_content("Players Average Age: 41")
     end

     within("#team-#{@team_3.id}") do
      expect(page).to have_content("Players Average Age: 34")
     end

     within("#team-#{@team_4.id}") do
      expect(page).to have_content("Players Average Age: 27.5")
     end
  end
end
