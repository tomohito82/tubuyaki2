class TweeetsController < ApplicationController
   before_action :set_tweeet, only: [:edit, :update, :destroy]

   def index
     @tweeets = Tweeet.all
   end
    
   def new
     if params[:back]
       @tweeet = Tweeet.new(tweeets_params)
     else
       @tweeet = Tweeet.new
     end
   end
    
   def create
     @tweeet = Tweeet.new(tweeets_params)
     if @tweeet.save
       redirect_to tweeets_path, notice: "ツイートしました！"
     else
       render 'new'
     end
   end
    
   def confirm
     @tweeet = Tweeet.new(tweeets_params)
     render :new if @tweeet.invalid?
   end
    
   def destroy
     @tweeet = Tweeet.find(params[:id])
     @tweeet.destroy
     redirect_to tweeets_path, notice: "削除しました！"
   end
    
   def edit
     @tweeet = Tweeet.find(params[:id])
   end
    
   def update
     @tweeet = Tweeet.find(params[:id])
    
     if @tweeet.update(tweeets_params)
       redirect_to tweeets_path, notice: "ブログを更新しました！"
     else
       render 'edit'
     end
   end
    
   def show
        
   end
    
  private
   def tweeets_params
     params.require(:tweeet).permit(:content)
   end
    
   def set_tweeet
     @tweeet = Tweeet.find(params[:id])
   end
end