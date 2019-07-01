class ProjectsController < ApplicationController
  before_action :set_project,  only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
  	@project = Project.new
  end

  def show
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		flash[:notice] = "Project has been created"
  		redirect_to @project
  	else
  		flash[:alert] = "Project has not been created."
  		render 'new'
  		
  	end
  end

    def edit 
    end

    def update
      if @project.update(project_params)
         flash[:notice] = "Projec has been updated"
         redirect_to @project
      else
        flash[:alert] = "Project has not been updated"
        render "edit"
      end
    end

    def update
      @project = Project.find(params[:id])
      @project.destroy
      flash[:notice] = "Project has been destroyed"
      redirect_to projects_path
    end


  private

  def project_params
  	params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end 
