require "rails_helper"

feature 'When a user visits a snack show page' do
  scenario 'they see the snacks attributes' do
    owner = Owner.create(name: "Sam's Snacks")
    snack_1 = Snack.create(name: "Snickers", price: 3)
    snack_2 = Snack.create(name: "Twix", price: 1)
    snack_3 = Snack.create(name: "Nerds", price: 5)
    dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1, snack_2])
    erics  = owner.machines.create(location: "Erics Mixed Drinks", snacks: [snack_1, snack_3])
    jons  = owner.machines.create(location: "Jons Mixed Drinks", snacks: [snack_3])

    visit snack_path(snack_1)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content("Price: #{snack_1.price}")
    expect(page).to have_content("Erics Mixed Drinks")
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to_not have_content("Jons Mixed Drinks")
  end
end
