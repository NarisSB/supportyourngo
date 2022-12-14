class ContributionsController < ApplicationController

  def index
    @contributions = Contribution.all
  end

  def show
    @contribution = Contribution.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @contribution = Contribution.new
    @project = Project.find(params[:project_id])
  end

  def create
    @contribution = Contribution.new(contribution_params)
    @project = Project.find(params[:project_id])
    @contribution.project = @project
    @contribution.user = current_user
    if @contribution.save
      redirect_to project_contribution_path(@project, @contribution), notice: "You have successfully contributed to this project!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def contribution_params
    params.require(:contribution).permit(:name, :amount)
  end
end
