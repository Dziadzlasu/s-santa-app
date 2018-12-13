require 'rails_helper'

describe LotteryService do
  context 'When testing the LotteryService class' do
    describe '#call' do
      before do
        user
        candidate
        bad_user
        subject.call
      end
      let(:user) { create(:random_user, registration_status: 'approved') }
      let(:bad_user) { create(:random_user) }
      let(:candidate) { create(:random_user, registration_status: 'approved') }
      let(:pairing) { Pairing.last }

      it { expect(user.recipient).to eq candidate }
      it { expect(candidate.recipient).to eq user }
      it { expect(user.recipient).not_to eq user }
      it { expect(candidate.recipient).not_to eq candidate }
      it { expect(user.recipient).not_to eq bad_user }
      it { expect(candidate.recipient).not_to eq bad_user }
      it { expect(bad_user.recipient).to be_nil }
      it { expect(bad_user.giver).to be_nil }
    end
  end
end
