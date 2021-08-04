require 'rails_helper'

RSpec.describe 'Register Team Page' do
  before :each do
    @competition = Competition.create!(name: "Women's Individual Gold Medal Match", location: 'Yumenoshima Park', sport: 'Archery')
    visit "/competitions/#{@competition.id}/teams/new"
  end

  it 'can add new team information to form' do
    fill_in(:hometown, with: 'United States of America')
    fill_in(:nickname, with: 'USA')

    click_button('Register Team')
    expect(current_path).to eq("/competitions/#{@competition.id}")
    expect(page).to have_content('United States of America')
  end
end
