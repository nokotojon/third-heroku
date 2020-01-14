class ComentsController < ApplicationController
  
  def new
   @coment = Coment.new
   @coment.topic_id = params[:topic_id]
   @coment.user_id = current_user.id
  end
  
  def create
    @coment = current_user.coments.new(coment_params)
    if @coment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private
  def coment_params
    params.require(:coment).permit(:user_id, :topic_id, :discription)
  end
end