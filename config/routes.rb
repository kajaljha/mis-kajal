  Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations", :confirmations => "confirmations" }

  #resources :sales
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
   #resources :users
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  root :to => 'users#index'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  get 'autocomplete_invoice' => 'application#autocomplete_invoice'
  get 'get_client_location' => 'invoices#get_client_location'
  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  get 'application/autocomplete' => 'application#autocomplete'
  get 'users/list_of_client' => 'users/list_of_client'

  resources :users do
    resources :employees do
      collection do
      get 'academic_skill_detail_new'
      post 'academic_skill_detail_create'
      get 'academic_skill_detail_edit'
      patch 'academic_skill_detail_update'
      get 'bank_identity_detail_new'
      post 'bank_identity_detail_create'
      get 'academic_skill_detail_display'
      get 'bank_identity_detail_display'
      get 'bank_identity_detail_edit'
      patch 'bank_identity_detail_update'
      get "project_detail_new"
      post "project_record"
      get "project_display"
      get 'project_detail_edit'
      patch 'project_detail_update'
      get "salary_details"
      post "salary_record"
      get "salary_display"
      get 'salary_details_edit'
      patch 'salary_details_update'
      get "previous_organization_detail_new"
      post "previous_organization_record"
      get "previous_organization_display"
      get 'previous_organization_edit'
      patch 'previous_organization_update'
      get "employee_dashboard"
      get "send_email"
      get "send_email_multiple"
      end 
    end
    resources :sales do
      collection do
        get 'sales_bde_new'
        post 'sales_bde_create'
        get 'sales_bde_display'
        get 'sales_bde_edit'
        patch 'sales_bde_update'
        get 'sales_consultant_new'
        get 'sales_consultant_display' 
        get 'sales_consultant_edit'
        patch 'sales_consultant_update'
        get 'client_project_details_new'
        get 'client_project_details_display'
        get 'client_project_details_edit'
        patch 'client_project_details_update'
        post 'client_project_details_create'
        delete 'client_project_details_destroy'
        get 'client_contact_details_new'
        get 'client_contact_details_display'
        post 'client_contact_details_create'
        get 'client_contact_details_edit'
        patch 'client_contact_details_update'
        get 'client_assigned_resources_new' 
        get 'client_assigned_resources_display' 
        post 'client_assigned_resources_create' 
        get 'client_assigned_resources_edit'
        patch 'client_assigned_resources_update'
        post 'sales_consultant_create'
        get 'client_basic_detail_new'
        post 'client_basic_detail_create'
        get 'client_basic_detail_display'
        get 'client_basic_detail_edit'
        patch 'client_basic_detail_update'
        get 'client_payment_detail_new'
        post 'client_payment_detail_create'
        get 'client_payment_detail_display'
        get 'client_payment_detail_edit'
        patch 'client_payment_detail_update'
        get "client_lists"
      end
    end

    resources :notifications do
      collection do
      get 'mark_notification_as_read'
      delete 'destroy_multiple'
      end
    end

    resources :holidays do
      collection do
        get "leave_accept"
        get "leave_reject"
        delete 'destroy_multiple'  
      end
    end

    resources :feedbacks do
      collection do
        # get "leave_accept"
        # get "leave_reject"  
      end
    end


    resources :invoices do
      get 'paid_invoice_list', :as => 'paid_index'
      get 'unpaid_invoice_list', :as => 'unpaid_index'
    end

    
    collection do
      delete 'destroy_multiple'
    end 
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
      resource :user, only: [:edit] do
      collection do
        get 'edit_password'
        patch 'update_password'
      end
    end
    
  end                                      
end
