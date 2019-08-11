require 'rails_helper'

RSpec.feature 'Comparation', type: :feature do
  scenario 'Verify links' do
    visit(root_path)
    expect(page).to have_link('Comparação')
    expect(page).to have_link('Ranking')
  end
  
  scenario 'Verify necessary strings in root_path' do
    visit(root_path)
    expect(page).to have_content('Qual político é melhor?')
    expect(page).to have_content('Escolha o político que tem contribuído mais com o Brasil')
    expect(page).to have_content('Senador(a)')
    expect(page).to have_content('Deputado(a)')
  end
  
  # scenario 'Verify link Escolha', js: true do
  #   visit(root_path)
  #   click_on("politician#{[1,2].sample}")
  #   
  #   expect(page).to have_content("Político escolhido: #{@politician.name}")
  # end
end
