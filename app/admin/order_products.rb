ActiveAdmin.register OrderProduct do
  permit_params :order_id, :product_id, :qty, :price
end
