class Public::ProceduresController < ApplicationController

  def show
    @procedure = Procedure.find(params[:id])
    @change = Change.new
  end

  def new
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new(procedure_params)
    @procedure.user_id = current_user.id
    @procedure.save
    redirect_to categories_path
  end

  private

  def procedure_params
    params.require(:procedure).permit(:user_id, :title, :image, :necessity_item, :body)
  end

end
