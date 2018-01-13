class Api::ProjectsController < ApplicationController
  before_action :set_api_project, only: [:show, :edit, :update, :destroy]

  # GET /api/projects
  # GET /api/projects.json
  def index
    @projects = Project.all
    render json: @projects, each_serializer: Projects::IndexSerializer
  end

  # GET /api/projects/1
  # GET /api/projects/1.json
  def show
    tasks = Task.where project: @project
    @project.tasks = tasks
    render json: @project, serializer: Projects:: ShowSerializer
  end

  # GET /api/projects/new
  def new
    @api_project = Api::Project.new
  end

  # GET /api/projects/1/edit
  def edit
  end

  # POST /api/projects
  # POST /api/projects.json
  def create
    @api_project = Project.new(api_project_params)

    respond_to do |format|
      if @api_project.save
        format.html { redirect_to @api_project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @api_project }
      else
        format.html { render :new }
        format.json { render json: @api_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/projects/1
  # PATCH/PUT /api/projects/1.json
  def update
    respond_to do |format|
      if @api_project.update(api_project_params)
        format.html { redirect_to @api_project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_project }
      else
        format.html { render :edit }
        format.json { render json: @api_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/projects/1
  # DELETE /api/projects/1.json
  def destroy
    @api_project.destroy
    respond_to do |format|
      format.html { redirect_to api_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_project_params
      params.fetch(:api_project, {})
    end
end
