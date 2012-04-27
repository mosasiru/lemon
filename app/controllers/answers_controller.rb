class AnswersController < ApplicationController
  def index
    @questions = Question.all
    @answer1 = Answer.find_all_by_ans(1)
    @answer2 = Answer.find_all_by_ans(2)
    @member = Member.find(params[:member_id])
    @answer = Answer.new
    @category = Category.all
  end

  def new
    @questions = Question.new
  end

  def show
    @question = Question.find(params[:question_id])
    @questioner = Member.find( @question.member_id )
    @category = Category.find( @question.category_id )
    @option1 = Answer.find_all_by_question_id_and_ans(params[:question_id],1)
    @option2 = Answer.find_all_by_question_id_and_ans(params[:question_id],2)
    @member = Member.find(params[:member_id])
  end

  def form_tag
    @answer = Answer.new
    @question = Question.new
  end

  def qcreate
    @question = Question.new(params[:questions])
    if @question.save
      redirect_to("/answers/index/1")
    else
      render :action => "new"
    end
  end

  def acreate
    @answer = Answer.new(params[:answer])
    if @answer.save
      redirect_to("/answers/show/" + params[:member_id] +'/'+ params[:question_id] )#+@answer.member_id.to_s+"/"+@answer.question_id.to_s)
    else
      render :action => "index"
    end
  end
end
