require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  describe '#full_name' do
    subject(:user) { build_stubbed(:user) }

    it { expect(user.full_name).to eq 'John Doe' }
  end
end
