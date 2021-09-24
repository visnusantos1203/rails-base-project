require 'rails_helper'

RSpec.describe "Homes", type: :feature do
  describe 'View all investments' do
    before { visit root_path }

    it 'shows welcome greeting in navbar' do
      within 'nav' do
        expect(page).to have_content 'Welcome,'
      end
    end

    it 'shows My Portfolio in navbar' do
      within 'nav' do
        expect(page).to have_content 'My Portfolio,'
      end
    end
  end
end
