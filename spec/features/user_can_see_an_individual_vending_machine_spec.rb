require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  scenario 'they see the snacks listed for that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    snack_1 = Snack.create(name: "Snickers", price: 3)
    snack_2 = Snack.create(name: "Twix", price: 1)
    dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1, snack_2])

    visit machine_path(dons)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content("Price: #{snack_1.price}")
    expect(page).to have_content("Price: #{snack_2.price}")
  end
end
