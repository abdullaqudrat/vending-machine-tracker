require 'rails_helper'

describe Owner, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should have_many :machines }
  end
  describe 'Instance Methods' do
    it 'should calculate average price of snacks for that machine' do
      owner = Owner.create(name: "Sam's Snacks")
      snack_1 = Snack.create(name: "Snickers", price: 3)
      snack_2 = Snack.create(name: "Twix", price: 1)
      snack_3 = Snack.create(name: "Nerds", price: 5)
      dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1, snack_2])

      expect(dons.average_snack_price).to eq(2)
    end
  end
end
