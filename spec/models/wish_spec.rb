require 'rails_helper'

describe Wish do
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:description) }

  describe 'scopes' do
    let(:pending_wish) { create(:wish) }
    let(:completed_wish) { create(:wish, description: 'chocolate', status: 'completed') }

    before do
      pending_wish
      completed_wish
    end

    describe 'pending' do
      it { expect(described_class.pending).to include(pending_wish) }
      it { expect(described_class.pending).not_to include(completed_wish) }
    end

    describe 'realised' do
      it { expect(described_class.realised).to include(completed_wish) }
      it { expect(described_class.realised).not_to include(pending_wish) }
    end
  end
end
