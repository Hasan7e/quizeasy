class AttemptsController < ApplicationController
  def show
    @attempt = Attempt.includes(answers: { question: :choices }).find(params[:id])
    @quiz    = @attempt.quiz
    @score   = @attempt.score
    @total   = @quiz.questions.count

    # build a quick lookup hash: question_id => answer
    @answers_by_question_id = @attempt.answers.index_by(&:question_id)
  end
end

