ActiveAdmin.register OrderProduct do
  permit_params :qty, :price, :order_id, :product_id
end
