require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:tournaments) }
    it { should have_many(:teams).through(:tournaments) }
  end
end
