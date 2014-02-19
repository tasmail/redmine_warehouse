require_dependency 'redmine_warehouse/view_issues_show_details_bottom_hook'

Redmine::Plugin.register :redmine_warehouse do
  name 'RedmineCRM Warehouse plugin'
  author 'Andrey Tkachenko'
  description 'This is a warehouse plugin for RedmineCRM'
  version '0.0.1'

  project_module :goods_module do	    
	  permission :view_goods, :goods => [:index]
	  permission :add_goods, :goods => [:new, :create]
	  permission :edit_goods, :goods => [:edit, :update]
	  permission :delete_goods, :goods => [:destroy]
	  permission :view_demo, :demo => [:index]
  end

  menu(
    :project_menu,
    :goods,
    { :controller => 'goods', :action => 'index' },
    :caption => :label_goods,
    :after => :activity,
    :param => :project_id)
 
  menu(
    :project_menu,
    :demo,
    { :controller => 'demo', :action => 'index' },
    :caption => :label_demo,
    :after => :activity)
end
