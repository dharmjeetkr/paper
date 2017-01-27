ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :name, :description, :image  


 index do
 	 id_column
 	 column :name
 	 column :description
 	 column :image do |product|
            image_tag(product.image.url(:thumb)) #it show image in index of product pannel
        end
    actions
  end

 #form multipart: true do |f|           
       form do |f|
    inputs 'details' do 
  	f.semantic_errors
  	f.inputs :name
  	f.inputs :description
        #f.inputs :Image do |product| 
       # link_to image_tag(product.image_url),admin_product_path(product)
   
    #link_to(image_tag(event.image.url(:thumb), :height => '100'), admin_event_path(event))

      f.inputs :image, :as=> :file
       
     f.actions
   end	
 end
end
