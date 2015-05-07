Deface::Override.new(virtual_path: 'spree/admin/products/index',
                     name: 'add_product_exports_link',
                     insert_after: '#new_product_link',
                     text: "<li id='products_exports_link'><%= button_link_to Spree.t(:product_exports), admin_exports_path, {:icon => 'file', :id => 'admin_product_exports', :style=> 'margin-left: 10px;' } %></li>",
                     disabled: false)
