require 'rails_helper'

RSpec.describe 'Competitions Index Page' do
  before :each do
    @competition_1 = Competition.create!(name: "Women's Individual Gold Medal Match", location: 'Yumenoshima Park', sport: 'Archery')
    @competition_2 = Competition.create!(name: "Men's Individual Gold Medal Match", location: 'Yumenoshima Park', sport: 'Archery')
    @competition_3 = Competition.create!(name: "Women's Individual Bronze Medal Match", location: 'Yumenoshima Park', sport: 'Archery')
    @competition_4 = Competition.create!(name: "Men's Individual Bronze Medal Match", location: 'Yumenoshima Park', sport: 'Archery')

    visit "/competitions"
  end

  describe 'Competition List' do
    it 'lists all competitions and links to their show page' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_2.name)
    expect(page).to have_content(@competition_3.name)
    expect(page).to have_content(@competition_4.name)

    expect(page).to have_link("#{@competition_1.name}")
    expect(page).to have_link("#{@competition_2.name}")
    expect(page).to have_link("#{@competition_3.name}")
    expect(page).to have_link("#{@competition_4.name}")
    end
  end

  describe 'Competition Links' do
    it 'competition link takes user to competition 1 show page' do
      click_link "#{@competition_1.name}"
      expect(current_path).to eq("/competitions/#{@competition_1.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_2.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_3.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_4.id}")
    end
    it 'competition link takes user to competition 2 show page' do
      click_link "#{@competition_2.name}"
      expect(current_path).to eq("/competitions/#{@competition_2.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_1.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_3.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_4.id}")
    end
    it 'competition link takes user to competition 3 show page' do
      click_link "#{@competition_3.name}"
      expect(current_path).to eq("/competitions/#{@competition_3.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_1.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_2.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_4.id}")
    end
    it 'competition link takes user to competition 4 show page' do
      click_link "#{@competition_4.name}"
      expect(current_path).to eq("/competitions/#{@competition_4.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_1.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_2.id}")
      expect(current_path).to_not eq("/competitions/#{@competition_3.id}")
    end
  end
end
