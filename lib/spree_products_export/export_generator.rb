require 'csv'
module SpreeProductsExport
  module ExportGenerator
    extend self
    BATCH_SIZE=100

    def variant_line_data(variant)
      product = variant.product
      [variant.sku, product.description, variant.price]
    end

    def generate(product_export)
      product_export.processed_rows = 0
      product_export.save!
      csv_string = CSV.generate do |csv|
        csv.add_row csv_headers
        Spree::Variant.where(is_master: false).find_each(batch_size: BATCH_SIZE) do |variant|
          csv.add_row variant_line_data(variant)
          product_export.increment(:processed_rows).save
        end
        file = StringIO.new(csv.string)
        fname = "Export #{Date.current}.csv"
        product_export.attachment = file
        product_export.attachment.instance_write(:content_type, 'text/csv')
        product_export.attachment.instance_write(:file_name, fname)
        product_export.save!
      end

    end

    private

    def csv_headers
      %w(SKU Description Price)
    end

  end
end
