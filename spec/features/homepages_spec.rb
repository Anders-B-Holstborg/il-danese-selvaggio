require 'rails_helper'

RSpec.describe 'Homepages' do
  describe 'GET root' do
    it 'displays the root page', driver: :selenium_chrome_headless do
      visit root_path

      expect(page).to have_content(I18n.t('homepages.title'))
      expect(page.title).to eql(I18n.t('homepages.meta_title'))
    end
  end
end
