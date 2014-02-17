class GoodsController < ApplicationController
    def index
      @project = Project.find(params[:project_id])
      @goods = Good.find(:all)
    end
end
