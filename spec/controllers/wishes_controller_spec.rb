require 'rails_helper'

describe WishesController do
  describe '#new' do
    let(:action) { get :new }

    before { action }
    it { expect(response).to be_success }
  end

  describe '#create' do
    let(:params) { { wish: { description: 'a nice gift'} } }
    let(:action) { post :create, params: params }

    before { action }
    it { expect(response).to be_redirect }
    it { expect(flash[:success]).to be_present }
  end
end
