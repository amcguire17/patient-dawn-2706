require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:tournaments) }
    it { should have_many(:competitions).through(:tournaments) }
  end
end
