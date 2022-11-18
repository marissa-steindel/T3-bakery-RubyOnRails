ActiveAdmin.register Product do
  # whitelist desired model attributes
  permit_params :name, :description, :price, :image

  # add image upload field to form - this is from the formtastic gem
  form do |f|
    # shows errors on :base - (validation errors)
    f.semantic_errors
    # builds an input field for every attribute
    f.inputs
    # adds the 'Submit' and 'Cancel' buttons
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
