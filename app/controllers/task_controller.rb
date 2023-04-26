class TaskController < ApplicationController
  def index
    @results = Task.all
  end
end
