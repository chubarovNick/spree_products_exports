module Spree
  class ProductExport < ActiveRecord::Base
    has_attached_file :attachment
    validates_attachment :attachment, content_type: { content_type: 'text/csv'}
    after_commit :run_export, on: :create

    def finished?
      total_rows == processed_rows
    end

    def finish_percent
      if total_rows > 0
        (processed_rows / total_rows.to_f) * 100
      else
        100
      end
    end

    private

    def run_export
      SpreeProductsExport::ExportGenerator.generate(self)
    end

  end
end

