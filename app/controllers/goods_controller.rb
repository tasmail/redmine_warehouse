class GoodsController < ApplicationController
  before_filter :find_project, :authorize
  before_filter :find_good, :authorize, :except => [:index, :new, :create]

  helper :sort
  include SortHelper
  def index
    sort_init 'created_on', 'desc'
    sort_update %w(title price quantity manufacture created_on)

    scope = Good
    scope = Good.where("title like ?", "%#{params[:title]}%") if params[:title].present?
    @goods = scope.order(sort_clause)
  end

  def new
    @good = Good.new
    @good.project = @project
    @good.attributes = params[:good] if params[:good] && params[:good].is_a?(Hash)
  end

  def create
    @good = Good.new(params[:good])
    @good.project = @project
    if @good.save
      flash[:notice] = l(:notice_successful_create)
      respond_to do |format|
        format.html { redirect_to (params[:continue] ?  {:action => "new", :project_id => @project} : {:action => "show", :project_id => @project, :id => @good} )}
      end
    else
      respond_to do |format|
        format.html { render :action => "new" }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @good.update_attributes(params[:good])
      flash[:notice] = l(:notice_successful_update)
      respond_to do |format|
        format.html { redirect_to :action => "show", :project_id => @project, :id => @good }
      end
    else
      respond_to do |format|
        format.html { render "edit", :project_id => @project, :id => @good  }
      end
    end
  end

  def destroy
    if @good.destroy
      flash[:notice] = l(:notice_successful_delete_good)
    end
    redirect_to :action => 'index', :project_id => @project
  end

  private

  def find_project
    project_id = params[:project_id]
    @project = Project.find(project_id)
  rescue ActiveRecord::RecordNotFound
    render_404
    end

  def find_good
    good_id = params[:id]
    @good = Good.find(good_id)
  rescue ActiveRecord::RecordNotFound
    render_404
    end
end
