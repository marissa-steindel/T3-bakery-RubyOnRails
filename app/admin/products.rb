ActiveAdmin.register Product do
  # whitelist desired model attributes
  permit_params :name, :description, :price, :image, product_categories_attributes: [:id, :product_id, :category_id, :_destroy]

  # customize the product read page - this is DSL, Domain Specific Language
  show do |product|
    attributes_table do
      row :name
      row :description
      row :price
      row :image do |product|
        if product.image.present?
          image_tag url_for(product.image)
        end
      end
      row :categories do |product|
        product.categories.map {|p| p.name}.join(", ").html_safe
      end
    end
  end

  # customize the create/edit form - this is from the formtastic gem
  form do |f|
    f.semantic_errors # shows errors on :base - (validation errors)
    f.inputs # builds an input field for every attribute
    f.inputs do
      f.input :image, as: :file
      f.has_many :product_categories, allow_destroy: true do |n_f|
        n_f.input :category
      end
    end
    f.actions # adds the 'Submit' and 'Cancel' buttons
  end

  # display image in index
  index do
    selectable_column
    column :name
    column :image
    column :price
    column :description
    column :categories
    actions
  end

end
