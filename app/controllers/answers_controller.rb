class AnswersController < ApplicationController
  before_filter :authenticate_user!, :except=>[:show, :index, :search, :searchview]

  def index
    if user_signed_in?
      @user = current_user.id
      if Member.where(:user_id => @user).exists?
        @questions = Question.all
        @questions = @questions.reverse
        @answer1 = Answer.find_all_by_ans(1)
        @answer2 = Answer.find_all_by_ans(2)
        @answer3 = Answer.find_all_by_ans(3)
        @answer4 = Answer.find_all_by_ans(4)
        @answer5 = Answer.find_all_by_ans(5)
        @member = Member.find_by_user_id(@user)
        @answer = Answer.new
        @category = Category.all
        @option1s = Option.find_all_by_order(1)
        @option2s = Option.find_all_by_order(2)
        @option3s = Option.find_all_by_order(3)
        @option4s = Option.find_all_by_order(4)
        @option5s = Option.find_all_by_order(5)
        @answered = Answer.find_all_by_member_id(@user)
        @answeredString = ""
        @answered.each do |answered|
          @answeredString = @answeredString +","+ answered.question_id.to_s
        end
        @answeredString = @answeredString.slice(1,@answeredString.length)
#        @rands = Question.find_by_sql("SELECT * FROM questions WHERE member_id = " + @user.to_s + " and id NOT IN ("+@answeredString+")")
#        @rand = @rands[rand(@rands.length)]
#        @reco = Recommend.find_by_sql("SELECT * FROM recommends WHERE member_id = " + @user.to_s + " and question_id NOT IN ("+@answeredString+")")
#        @reco = @reco[rand(@reco.length)]
        if @reco != nil
          @reco = Question.find(@reco.question_id)
        end
      else

      end
    else
      @questions = Question.all
      @questions = @questions.reverse
      @answer1 = Answer.find_all_by_ans(1)
      @answer2 = Answer.find_all_by_ans(2)
      @answer3 = Answer.find_all_by_ans(3)
      @answer4 = Answer.find_all_by_ans(4)
      @answer5 = Answer.find_all_by_ans(5)
      @answer = Answer.new
      @category = Category.all
        @option1s = Option.find_all_by_order(1)
        @option2s = Option.find_all_by_order(2)
        @option3s = Option.find_all_by_order(3)
        @option4s = Option.find_all_by_order(4)
        @option5s = Option.find_all_by_order(5)
        
    end
  end

  def searchview
    @message = params['message']
    if params['result'] != nil
      @questions = Question.find(params['result'])
      @questions = @questions.reverse
    else
      @questions = nil
    end
      @answer1 = Answer.find_all_by_ans(1)
      @answer2 = Answer.find_all_by_ans(2)
      @answer3 = Answer.find_all_by_ans(3)
      @answer4 = Answer.find_all_by_ans(4)
      @answer5 = Answer.find_all_by_ans(5)
      @answer = Answer.new
      @category = Category.all
        @option1s = Option.find_all_by_order(1)
        @option2s = Option.find_all_by_order(2)
        @option3s = Option.find_all_by_order(3)
        @option4s = Option.find_all_by_order(4)
        @option5s = Option.find_all_by_order(5)
  end
  
  def newuser
  @user = current_user.id
    if user_signed_in?
      @user = current_user.id
    end
  end

  def new
  @user = current_user.id
    @questions = Question.new
    @option1 = Option.new
    @option2 = Option.new
    @option3 = Option.new
    @option4 = Option.new
    @option5 = Option.new
  end

  def show
    if user_signed_in?
      @user = current_user.id
    end
    @question = Question.find(params[:question_id])
    @questioner = Member.find( @question.member_id )
    @category = Category.find( @question.category_id )
    @option1 = Answer.find_all_by_question_id_and_ans(params[:question_id],1)
#    @tester = @option1.Member.all
#    @option1.membername = Member.find(@option1.member_id)
    @option2 = Answer.find_all_by_question_id_and_ans(params[:question_id],2)
#    @member = Member.find(params[:member_id])
    @option3 = Answer.find_all_by_question_id_and_ans(params[:question_id],3)
    @option4 = Answer.find_all_by_question_id_and_ans(params[:question_id],4)
    @option5 = Answer.find_all_by_question_id_and_ans(params[:question_id],5)
    @nameOfOption1 = Option.find_by_question_id_and_order(params[:question_id],1)
    @nameOfOption2 = Option.find_by_question_id_and_order(params[:question_id],2)
    @nameOfOption3 = Option.find_by_question_id_and_order(params[:question_id],3)
    @nameOfOption4 = Option.find_by_question_id_and_order(params[:question_id],4)
    @nameOfOption5 = Option.find_by_question_id_and_order(params[:question_id],5)
    
  end
  
  def detail
    @user = current_user.id
    @question = Question.find(params[:question_id])
    @questioner = Member.find( @question.member_id )
    @category = Category.find( @question.category_id )
    @option1 = Answer.find_all_by_question_id_and_ans(params[:question_id],1)
    @option2 = Answer.find_all_by_question_id_and_ans(params[:question_id],2)
    @option3 = Answer.find_all_by_question_id_and_ans(params[:question_id],3)
    @option4 = Answer.find_all_by_question_id_and_ans(params[:question_id],4)
    @option5 = Answer.find_all_by_question_id_and_ans(params[:question_id],5)
    
  end

  def form_tag
    @answer = Answer.new
    @question = Question.new
    @member = Member.new
    @option1 = Option.new
    @option2 = Option.new
    @option3 = Option.new
    @option4 = Option.new
    @option5 = Option.new
  end

  def qcreate
    @question = Question.new(params[:question])
    if @question.save
      @option1 = Option.new(params[:option1])
      @option1.order = 1
      @option1.question_id = @question.id
      @option2 = Option.new(params[:option2])
      @option2.order = 2
      @option2.question_id = @question.id
      @option3 = Option.new(params[:option3])
      if @option3.string != ''
        @option3.order = 3
        @option3.question_id = @question.id
        @option3.save
      end
      @option4 = Option.new(params[:option4])
      if @option4.string != ''
        @option4.order = 4
        @option4.question_id = @question.id
        @option4.save
      end
      @option5 = Option.new(params[:option5])
      if @option5.string != ''
        @option5.order = 5
        @option5.question_id = @question.id
        @option5.save
      end
      respond_to do |format|
        if @option1.save && @option2.save
          format.html { redirect_to("/answers/index", :notice => 'question was successfully created.')}
          format.xml  { render :xml => @question, :status => :created, :location => "/answers/index"}
#      redirect_to("/answers/index")
        else
          format.html { render :action => "new"}
          format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
#        render :action => "new"
        end
      end
    else
      redirect_to("/answers/new")
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

  def search
    @message = params[:keywd]
    @result = Question.find(:all, :conditions => ["title like ?", "%"+params[:keywd]+"%"])
    redirect_to :action =>"searchview", :result => @result , :message => @message
  end
end
