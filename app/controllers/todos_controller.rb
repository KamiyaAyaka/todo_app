class TodosController < ApplicationController
    def index
        @todos = Todo.where(completed: false)
    end

    def new
        @todo = Todo.new
    end

    def create
        todo = Todo.new(todo_params)
        todo.save
        redirect_to todo_path(todo.id)
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        todo = Todo.find(params[:id])
        todo.update(todo_params)
        redirect_to todo_path
    end

    def destroy
        todo = Todo.find(params[:id])
        todo.destroy
        redirect_to todos_path
    end

    def completed
        @todos = Todo.where(completed: true)
    end

    private
    def todo_params
        params.require(:todo).permit(:title, :completed)
    end
end
