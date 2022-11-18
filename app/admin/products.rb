ActiveAdmin.register Product do
  # whitelist desired model attributes
  permit_params :name, :description, :price, :image

  # add image upload field to form - this is from the formtastic gem
  form do |f|
    f.semantic_errors # shows errors on :base - (validation errors)
    f.inputs # builds an input field for every attribute
    f.inputs do
      f.input :image, as: :file
    end
    f.actions# adds the 'Submit' and 'Cancel' buttons
  end

  # display image in index
  index do
    selectable_column
    column :name
    column :image
    column :price
    column :description
    actions
  end

end
