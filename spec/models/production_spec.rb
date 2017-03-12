require 'rails_helper'

RSpec.describe Production, type: :model do
  it { should belong_to(:product) }

  it { should validate_presence_of(:count) }
  it { should validate_presence_of(:date) }
end
