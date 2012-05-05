class AnswersController < ApplicationController
  before_filter :authenticate_user! 

  def index
  @user = current_user.id
    if Member.where(:user_id => @user).exists?
      @questions = Question.all
      @answer1 = Answer.find_all_by_ans(1)
      @answer2 = Answer.find_all_by_ans(2)
      @member = Member.find_by_user_id(@user)
#    @member = Member.find(params[:member_id])
      @answer = Answer.new
      @category = Category.all
    else
       redirect_to("/answers/newuser")
    end
  end
  
  def newuser
  @user = current_user.id
  
  end

  def new
  @user = current_user.id
    @questions = Question.new
  end

  def show
  @user = current_user.id
    @question = Question.find(params[:question_id])
    @questioner = Member.find( @question.member_id )
    @category = Category.find( @question.category_id )
    @option1 = Answer.find_all_by_question_id_and_ans(params[:question_id],1)
#    @tester = @option1.Member.all
#    @option1.membername = Member.find(@option1.member_id)
    @option2 = Answer.find_all_by_question_id_and_ans(params[:question_id],2)
#    @member = Member.find(params[:member_id])
  end

  def form_tag
    @answer = Answer.new
    @question = Question.new
    @member = Member.new
  end

  def qcreate
    @question = Question.new(params[:question])
    if @question.save
      redirect_to("/answers/index")
    else
      render :action => "new"
    end
  end

  def acreate
    @answer = Answer.new(params[:answer])
    if @answer.save
      redirect_to("/answers/show/" + params[:question_id] )
    else
      render :action => "index"
    end
  end

  def mcreate
    @member = Member.new(params[:member])
    if @member.save
      redirect_to("/answers/index")
    else
      render :action => "newuser"
    end
  end


end
