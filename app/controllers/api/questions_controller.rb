class Api::QuestionsController < ApplicationController
  def index
    @questions = Question.all
    respond_to do |format|
      # format.json { render json: @questions }
      format.json
    end
  end

  def create
    if @question = Question.create(params.require(:question).permit(:title))
      render json: @question, status: :created
    else
      render json: @question.errors, status: :not_acceptable
    end
  end
end
