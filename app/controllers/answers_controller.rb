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
    respond_to do |format|
      if @question.save
        format.html { redirect_to("/answers/index", :notice => 'question was successfully created.')}
        format.xml  { render :xml => @question, :status => :created, :location => "/answers/index"}
#      redirect_to("/answers/index")
      else
        format.html { render :action => "new"}
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
#        render :action => "new"
      end
    end
  end

  def acreate
    @answer = Answer.new(params[:answer])
    respond_to do |format|
      if @answer.save
        format.html { redirect_to("/answers/show/"+params[:question_id], :notice => 'answer was successfully created.')}
        format.xml  { render :xml => @answer, :status => :created, :location => '/answers/show/'+params[:question_id]}
#        redirect_to("/answers/show/" + params[:question_id] )
      else
        format.html { render :action => "index"}
        format.xml  { render :xml => @answer.errors, :status => :unprocessable_entity }
#        render :action => "index"
      end
    end
  end

  def mcreate
    @member = Member.new(params[:member])
    respond_to do |format|
      if @member.save
        format.html { redirect_to("/answers/index", :notice => 'member was successfully created.')}
        format.xml  { render :xml => @member, :status => :created, :location => "/answers/index"}
#        redirect_to("/answers/index")
      else
        format.html { render :action => "newuser"}
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
#        render :action => "newuser"
      end
    end
  end


end
