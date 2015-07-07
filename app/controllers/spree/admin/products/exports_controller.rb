module Spree
  module Admin
    class Products::ExportsController < BaseController

      def index
        @product_exports = Spree::ProductExport.all.order(:created_at)
        respond_with @product_exports
      end

      def create
        @product_export = Spree::ProductExport.create(total_rows: Spree::Variant.count)
      end

    end
  end
end
