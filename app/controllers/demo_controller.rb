class DemoController < ApplicationController
    before_filter :find_project
    def index
    end
private
  def find_project
    id = params[:id]
    @project = Project.find(id)
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end