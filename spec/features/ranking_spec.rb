require 'rails_helper'

RSpec.feature 'Ranking', type: :feature do
  scenario 'Verify links' do
    visit(ranking_index_path)
    expect(page).to have_link('Comparação')
    expect(page).to have_link('Ranking')
  end
  
  scenario 'Verify necessary strings in ranking_index_path' do
    visit(ranking_index_path)
    expect(page).to have_content('Ranking dos políticos')
    expect(page).to have_content('Senador(a)')
    expect(page).to have_content('Deputado(a)')
  end
  
  # scenario 'verify #show' do
end
