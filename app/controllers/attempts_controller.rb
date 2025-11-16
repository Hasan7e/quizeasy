class AttemptsController < ApplicationController
  def show
    @attempt = Attempt.find(params[:id])
    @quiz    = @attempt.quiz
    @score   = @attempt.score
    @total   = @quiz.questions.count
  end
end
