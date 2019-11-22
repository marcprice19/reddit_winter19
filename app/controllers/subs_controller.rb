class SubsController < ApplicationController

  #Model - all the logic having to do with the table or record, database
  #contraints, associations
  #fat models and skinny controllers

  #Views - whatever the user sees and interacts with, front end, little logic
  
  #Controller / routes - traffic director
  #actions - what you do on the app
    #actions must return a response
    #HTML XML JSON
    # IF IT DOESNT RETURN A RESPONSE THEN REDIRECT TO ANOTHER ACTIONS THAT DOES

    #callback - preform logic at certain actions
    # before_action
    # after_action
    # skip_before_action

    # before_action :method_to_call
    # before_action :method_to_call, only [:index, :show]
    # before_action :method_to_call, expect [:index, :show]
    

    #Read - GET

      # index action - all of the record of the table
      #   def index
      #     @model_names = Model.name.all
      #     # set into instance variable and grabs all the records
      #   end
    
      # show action - show a single record, id, id is which record you want to sees
      #   def show
      #     @model_name = Model.name.find(params[:id])
      #   end
  
      # new action - display the new record form, creates the record in memory
      #   def new
      #     @model_name = Model_name.new
      #   end

      # edit action - display the edit record form, needs id, which record to update
      #   def edit
      #     @model_name = Model_name.find(params[:id])
      #   end

  #Create / POST
    # creates a record in db from the new action
    # def create
    #   @model_name = Model_name.new(model_name_params)
    #   if  @model.name.save 
    #       do something or go somewhere
    #   else
    #     render :new
    #   end
    # end

      #model_name_params
    # passes certain attributes
    #   private
    #     def model_name_params
    #       params.require(:model_name).permit(:attr1, :attr2, :attr3, :everything the table has)
    #     end
  
  #Update / PUT / PATCH
    # edit a recod, from edit from, id, which one to update
      # def update
      #   @model_name = Model_name.find(params[:id])
      #   if @model_name.update(model_name_params)
      #     do something
      #   else
      #     render :edit
      #   end
      # end
  
  #Destroy / DELETE
    # This will delete the entire record, needs an id, to know which one to delete
      # def destroy
      #   @model_name = Model_name.find(params[:id])
      #   @model_name.destroy

      #   or

      #   Model_name.find(params[:id]).destroy
      # end

#   def index
#     @subs = Sub.all
#   end

#   def show
#     @sub = Sub.find(params[:id])
#   end

#   def new
#     @sub = Sub.new
#   end

#   def create
#     @sub = Subs.new(sub_params)
#     if @sub.save
#       redirect_to @sub
#       # redirect_to sub_path(@sub)
#     else
#       render :new
#     end
#   end

#   def edit
#     @sub = Sub.find(params[:id])
#   end

#   def update
#     @sub = Sub.find(params[:id])
#     if  @sub.update(sub_params)
#       redirect_to subs_path
#     else
#       render edit
#     end
#   end

#   def destroy
#     @sub = Sub.find(params[:id])
#     @sub.destroy

#     # or 

#     # Sub.find(params[:id]).destroy
#   end

#   private
#     def sub_params
#       params.require(:sub).permit(:name)
#     end
# end

before_action :set_sub, only: [:show, :update, :edit, :destroy]

def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
    render partial: 'form'
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to @sub
      # redirect_to sub_path(@sub)
    else
      render :new
    end
  end

  def edit
    render partial: 'form'
  end

  def update
    if  @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy

    redirect_to subs_path
    # or 

    # Sub.find(params[:id]).destroy
  end

  private
    def set_sub
      @sub = Sub.find(params[:id])
    end

    def sub_params
      params.require(:sub).permit(:name)
    end
end
