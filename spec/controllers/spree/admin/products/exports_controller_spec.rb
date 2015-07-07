describe Spree::Admin::Products::ExportsController do
  stub_authorization!

  describe '#index' do
    subject { spree_get(:index) }

    it { is_expected.to be_success }

  end

  describe '#create' do
    subject(:post_request) { spree_post(:create, format: :js) }

    it { is_expected.to be_success }

    it 'create product export' do
      expect { post_request }.to change(Spree::ProductExport, :count).by(1)
    end

  end

  describe '#show' do
    let!(:product_export) { create(:product_export) }
    subject(:show_export) { spree_get(:show, format: format, id: product_export.id) }

    context 'when format is json' do
      let(:format) { :json }

      it { is_expected.to be_success }

    end

    context 'when format is html' do
      let(:format) { :html }

      it { is_expected.to be_redirect }

    end

  end

end