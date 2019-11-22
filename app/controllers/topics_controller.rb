class TopicsController < ApplicationController
  
  # Model_name  -> @parent.children(s) - plural
  # Define @parent
  # before_action set_parent

  # private
  #   def set_parent
  #     @parent = Model_name_of_parent.find(params[:parent_id])
  #   end
  
  before_action :set_sub
  before_action :set_topic, only: [:show, :update, :edit, :destroy]
  
  def index
    @topics = @sub.topics
  end

  def show
  end

  def new
    @topic = @sub.topics.new
    render patial: 'form'
  end

  def edit
    render patial: 'form'
  end

  def create
    @topic = @sub.topics.new(topic_params)
    if @topic.save
      redirect_to[@sub, @topic]
    else
      render :new
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to [@sub, @topic]
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to sub_topics_path(@sub)
  end


  private

  def topic_params
    params.require(:topic).permit(:name, :body)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_sub
    @sub = Sub.find(params[:sub_id])
  end
end
