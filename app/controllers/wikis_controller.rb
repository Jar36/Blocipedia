class WikisController < ApplicationController
  def index
   #@wikis = Wiki.all.paginate(page: params[:page], per_page: 5)
    @wikis = policy_scope(Wiki)
   
  end

  def show
    @wiki = Wiki.find(params[:id])
    
  end

  def new
    @wiki = Wiki.new
  end
  
  def create 
    @wiki = current_user.wikis.new(wiki_params)
    @wiki.assign_attributes(wiki_params)
    authorize @wiki
    
    if @wiki.save
      flash[notice] = "Your wiki was saved successfully."
     redirect_to @wiki
    else
     flash.now[:alert] = "There was an error creating your wiki. Please try again."
     render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize(@wiki)
    
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    

     if @wiki.update(wiki_params)
       flash[:notice] = "Your wiki was updated."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error saving your wiki. Please try again."
       render :edit
     end
  end
  
  def destroy 
    @wiki = Wiki.find(params[:id])
    authorize(@wiki)
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
  end
  
  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
