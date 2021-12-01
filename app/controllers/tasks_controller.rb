class TasksController < ApplicationController
  before_action :set_category
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new    
    # @task = Task.new    
    @task = @category.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  # def create    
  #   @task = Task.new(task_params)

  #   respond_to do |format|
  #     if @task.save
  #       format.html { redirect_to @category, notice: "Task was successfully created." }
  #       format.json { render :show, status: :created, location: @task }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @task.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @task = @category.tasks.build(task_params)
      respond_to do |format|
      if @task.save
        # flash[:notice] = "Task was successfully created"
        format.html {  redirect_to category_path(@category.id), notice: "Task was successfully created." }           
      else
          render :new
      end      
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @category, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @category, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :body, :task_date, :category_id)
    end
end
