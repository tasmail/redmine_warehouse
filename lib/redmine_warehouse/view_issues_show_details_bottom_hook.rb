module RedmineWarehouse
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_issues_show_details_bottom,
              :partial => 'issues/show_good'
  end
end