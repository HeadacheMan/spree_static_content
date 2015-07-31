RSpec.feature 'Admin Page Content', :js do
  stub_authorization!

  context 'when no page category exists' do

    background do
      visit spree.admin_page_categories_path
    end

    scenario 'can create a new page category' do
      expect(page).to have_text 'No Page category found, Add One!'

      click_link 'New page category'
      expect(page).to have_text 'New page category'

      fill_in 'page_category_name', with: 'Information'
      fill_in 'page_category_description', with: 'Not really needed'

      expect(find('#page_category_visible')).to be_checked

      click_button 'Create'
      expect(page).to have_text 'successfully created!'

    end
  end

  context 'when page category exists' do
    given!(:page_category) { create(:page_category) }

    background do
      visit spree.admin_page_categories_path
    end

    scenario 'can be updated' do
      within_row(1) { click_icon :edit }

      fill_in 'page_category_name', with: 'Updated Information'

      click_button 'Update'
      expect(page).to have_text 'successfully updated!'
    end

    scenario 'can be deleted' do
      within_row(1) { click_icon :delete }
      page.driver.browser.switch_to.alert.accept unless Capybara.javascript_driver == :poltergeist
      expect(page).to have_text 'successfully removed!'
    end

  end

end