require 'rails_helper'

RSpec.describe Tournament do
  describe 'relationships' do
    it { should belong_to(:team) }
    it { should belong_to(:competition) }
  end
end
