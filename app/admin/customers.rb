ActiveAdmin.register Customer do
  permit_params :name, :username, :password, :salt, :address, :province_id
end
