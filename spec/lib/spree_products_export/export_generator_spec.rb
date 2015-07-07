describe SpreeProductsExport::ExportGenerator do

  describe '.generate' do
    let!(:variant) { create(:variant) }
    let(:product) { variant.product }
    let!(:export) { create(:product_export) }
    subject(:generate) { SpreeProductsExport::ExportGenerator.generate(export) }

    it 'collect product data' do
      expect { generate }.to change(export, :attachment_file_name)
      expect(File.read(export.attachment.path)).to include(variant.sku)
      expect(File.read(export.attachment.path)).to include(variant.price.to_s)
      expect(File.read(export.attachment.path)).to include(product.description)
    end

  end

end