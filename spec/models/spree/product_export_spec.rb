describe Spree::ProductExport, type: :model do
  let(:export) { Spree::ProductExport.new }

  describe '#finish_percent' do
    subject { export.finish_percent }

    context 'when export is just initialized' do

      it { is_expected.to eq(100) }

    end

    context 'when some rows are present' do
      before { export.total_rows = 100 }

      it { is_expected.to eq(0) }

      context ' and some rows already processed' do
        before { export.processed_rows = 50 }

        it { is_expected.to eq(50) }

      end

    end

  end

end
