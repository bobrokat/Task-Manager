class Api::TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /api/tasks
  # GET /api/tasks.json
  def index
    @tasks = Task.where user: current_user
    render json: @tasks, each_serializer: Tasks::IndexSerializer
  end

  # GET /api/tasks/1
  # GET /api/tasks/1.json
  def show
    comments = Comment.where task: @task
    @task.comments = comments
    render json: @task, serializer: Tasks:: ShowSerializer
  end

  # GET /api/tasks/new
  def new
    @task = Task.new
  end

  # GET /api/tasks/1/edit
  def edit
  end

  # POST /api/tasks
  # POST /api/tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/tasks/1
  # PATCH/PUT /api/tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/tasks/1
  # DELETE /api/tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.fetch(:task, {})
    end
end
