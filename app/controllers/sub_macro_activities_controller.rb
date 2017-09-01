class SubMacroActivitiesController < ApplicationController

  before_action :set_sub_macro_activity, only: [:edit, :update, :destroy]
  before_action :set_macro_activity, only: [:new, :edit]

  def new
    @sma = SubMacroActivity.new
  end

  def create
    @sma = SubMacroActivity.new(sub_macro_activity_params)
    if @sma.save
      redirect_to project_path(@sma.macro_activity.project_id),
                  notice: "Sub Macro Atividade criada com sucesso!"
    else
      render :new, locals: { :@macro_activity => MacroActivity.find(params[:ma]) }
    end
  end

  def edit
  end

  def update
    if @sma.update(sub_macro_activity_params)
      redirect_to project_path(@sma.macro_activity.project_id),
                  notice: "Sub Macro Atividade atualizada com sucesso!"
    else
      render :edit, locals: { :@macro_activity => MacroActivity.find(params[:ma]) }
    end
  end

  def destroy
    project_id = @sma.macro_activity.project_id
    if @sma.destroy
      redirect_to project_path(project_id),
                  notice: "Sub Macro Atividade excluído com sucesso!"
    else
      redirect_to project_path(project_id),
                  notice: "Erro ao tentar excluir aSub Macro Atividade..."
    end
  end

  private

  def set_sub_macro_activity
    @sma = SubMacroActivity.find(params[:id])
  end

  def set_macro_activity
    @macro_activity = MacroActivity.find(params[:ma])
  end

  def sub_macro_activity_params
      params.require(:sub_macro_activity).permit(:id, :description,
                                                 :completeness,
                                                 :macro_activity_id)
  end
end
