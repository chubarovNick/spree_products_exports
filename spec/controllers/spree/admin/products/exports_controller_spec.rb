describe Spree::Admin::Products::ExportsController do
  stub_authorization!

  describe '#index' do
    subject { spree_get(:index) }

    it { is_expected.to be_success }

  end

  describe '#create' do
    subject(:post_request) { spree_post(:create, format: :js) }

    it { is_expected. to be_success}

    it 'create product export' do
      expect { post_request }.to change(Spree::ProductExport, :count).by(1)
    end

  end
end