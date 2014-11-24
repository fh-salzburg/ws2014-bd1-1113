class QuestionsController < ApplicationController
  before_action :get_question, only: [:show, :update, :edit, :destroy ]

  def index
    @questions = Question.all
    respond_to do |format|
      format.json { render json: @questions }
      format.html #  { render 'index' }
    end
    
    # implizit: render 'index'
  end

  def show
    # implizit: render 'show'
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(params.require(:question).permit(:title, :body))
      flash[:message] = "gespeichert!"
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def get_question
    @question = Question.find(params[:id])
  end
end
