describe Spree::Admin::Products::ExportsController do

  describe '#index' do
    subject { get(:index) }

    it { is_expected.to be_success }

  end

end