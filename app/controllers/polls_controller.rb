class PollsController < ApplicationController
  before_filter :authorize

  def index
    @polls = polls_list
  end

  def new
    @user = User.find(current_user.id)
    @poll = Poll.new(user_id: current_user.id)
    2.times do @poll.options.build end
  end

  def create
    @poll = Poll.new(survey_params)

    if @poll.save
      @polls = polls_list
      render :index
    else
      render action: :new
    end
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def update
    @poll = Poll.find(params[:id])
    @poll.update_attributes(survey_params)
    if @poll.save
      @polls = polls_list
      render :index
    else
      render action: :edit, id: @poll.id
    end
  end

  def show
    id = Base64.urlsafe_decode64(params[:id].split('/').last).split('/').last
    @poll = Poll.find(id)
  end

  def destroy
    poll = Poll.find(params[:id])
    poll.destroy
    @polls = polls_list
    respond_to do |format|
      format.js { render js: "$('#poll-#{poll.id}').remove();" }
    end
  end

  def vote
    option = Option.find(params[:option])
    option.votes += 1
    option.save
    @poll = option.poll
  end

  private

  def survey_params
    params.require(:poll).permit(:title, :user_id, options_attributes: [:title, :id])
  end

  def polls_list
    current_user.polls.search(params[:search]).page(params[:page]).limit(5).order('created_at DESC')
  end

end