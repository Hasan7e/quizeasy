class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :take, :submit]

  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes or /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: "Quiz was successfully created." }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: "Quiz was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy!

    respond_to do |format|
      format.html { redirect_to quizzes_path, notice: "Quiz was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

#new vulnerable quizz taking action 
def take
  @questions = @quiz.questions.includes(:choices)
end

def submit
  @questions = @quiz.questions.includes(:choices)
  @score = 0
  @total = @questions.size
  attempt = @quiz.attempts.create!(
    name: params[:name].presence || "Guest",
    finished_at: Time.current
  )

  @questions.each do |q|
    chosen_id = params.dig(:answers, q.id.to_s)
    attempt.answers.create!(question: q, choice_id: chosen_id)

    if chosen_id.present?
      choice = q.choices.find_by(id: chosen_id)
      @score += 1 if choice&.correct
    end
  end

  attempt.update!(score: @score)

  render :result
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.expect(quiz: [ :title, :description ])
    end
end
