ActiveAdmin.register CustomerOrder do
  permit_params :customer_id, :order_id, :GST, :PST, :HST
end
