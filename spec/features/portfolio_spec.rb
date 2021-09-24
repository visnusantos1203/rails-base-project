require 'rails_helper'

RSpec.describe 'Portfolios', type: :feature do
  describe 'View all investments' do
    before { visit root_path }

    it 'shows all investments in Portfolio page' do
      within 'body' do
        expect(page).to have_content 'My Investments'
      end
    end
  end
end
