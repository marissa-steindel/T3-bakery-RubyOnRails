ActiveAdmin.register Order do
  permit_params :customer_id, :status
end
