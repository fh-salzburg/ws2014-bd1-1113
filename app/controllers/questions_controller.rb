class QuestionsController < ApplicationController
  before_action :get_question, except: [ :index ]

  def index
    @questions = Question.all
  end

  def show
  end

  def update
    @question.update(params.require(:question).permit(:title, :body))
    flash[:message] = "gespeichert!"
    redirect_to @question
  end

  def get_question
    @question = Question.find(params[:id])
  end
end
