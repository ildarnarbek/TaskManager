class Api::V1::TasksController < Api::V1::ApplicationController

  def index
    tasks = Task
      .order(created_at: :desc)
      .ransack(ransack_params)
      .result
      .page(page)
      .per(per_page)
  
    respond_with(tasks, each_serializer: TaskSerializer, root: 'items', meta: build_meta(tasks))
  end

  def show
    task = Task.find(params[:id])
 
    respond_with(task, serializer: TaskSerializer)
  end

  def create
    task = current_user.my_tasks.new(task_params)
    puts "create!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
    # puts "current user #{current_user} #{current_user.first_name}"
    puts "task_params #{task_params}"
    puts "task #{task.name} #{task.description} #{task.author_id} #{task.assignee_id}"
    task.save
    # puts "task #{task.name} #{task.description} #{task.author_id} #{task.assignee_id}"
    
    respond_with(task, serializer: TaskSerializer, location: nil)
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
  
    respond_with(task, serializer: TaskSerializer)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
  
    respond_with(task)
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description, :author_id, :assignee_id, :state_event, :expired_at)
  end
end