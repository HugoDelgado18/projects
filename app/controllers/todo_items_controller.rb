class TodoItemsController < ApplicationController
    before_action :set_todo_list
    before_action :set_todo_item, except: [:create]

    def create
    @todo_item = TodoItem.new(todo_item_params)

    respond_to do |format|
        if @todo_item.save 
            format.html { redirect_to @todo_list}
            format.json { render :show, status: :created, location: @todo_list }
        else 
            redirect_to @todo_list
            format.json { render json: @todo_list.errors, status: :unprocessable_entity }
        end
      end 
    end 

   def update 
    @todo_item = TodoItem.find(params[:id])

    respond_to do |format|
        if @todo_item.update(todo_item_params)
            redirect_to todo_list_path(@todo_item.todo_list_id)
        else 
            redirect_to todo_lists_path 
            format.json { render json: @todo_item.errors, status: :unprocessable_entity }
        end 
      end 
    end 

   def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
     flash[:success] = "Todo List item was deleted."
    else
     flash[:error] = "Todo List item could not be deleted."
    end
    redirect_to @todo_list 
   end

   private

   def set_todo_list 
    @todo_list = TodoList.find(params[:todo_list_id])
   end 

   def set_todo_item 
    @todo_item = @todo_list.todo_items.find(params[:id])
   end 

   def todo_item_params
    params.require(:todo_item).permit(:content)
   end

end