require 'rails_helper'

feature 'User fills in field with word' do
  scenario 'it validates that word' do
    # Background:
    # * This story should use the Oxford Dictionaries API https://developer.oxforddictionaries.com/documentation
    # * Use endpoint "GET /inflections/{source_lang}/{word_id}" under the "Lemmatron" heading

    # When I visit "/"
    visit '/'
    # And I fill in a text box with "foxes"
    fill_in 'q', with: 'fox'
    # And I click "Validate Word"
    click_on 'Validate Word'
    # Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
    expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
  end
  # 
  # scenario 'it gives feedback that a word is not valid' do
  #   # When I visit "/"
  #   visit '/'
  #   # And I fill in a text box with "foxez"
  #   fill_in 'q', with: 'foxez'
  #   # And I click "Validate Word"
  #   click_on 'Validate Word'
  #   # Then I should see a message that says "'foxez' is not a valid word."
  #   expect(page).to have_content("'foxez' is not a valid word.")
  # end
end
