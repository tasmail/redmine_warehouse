Redmine::Plugin.register :warehouse do
  name 'RedmineCRM Warehouse plugin'
  author 'Andrey Tkachenko'
  description 'This is a warehouse plugin for RedmineCRM'
  version '0.0.1'

  permission :view_goods, { :goods => [:index] }, :public => true
  menu(
    :project_menu,
    :goods,
    { :controller => 'goods', :action => 'index' },
    :caption => :label_goods,
    :after => :activity,
    :param => :project_id)
end
