class WeeksController < ApplicationController
  def edit
    @week = Week.find(params[:id])
    @project = params[:project]

    if params[:hours_registry].present?
      @hours_registry = HoursRegistry.find(params[:hours_registry])
    else
      @hours_registry = HoursRegistry.new
      @hours_registry.hours_performed = 0
      @hours_registry.user_id = params[:user_id]
      @hours_registry.week_id = @week.id
      @hours_registry.project_id = @project
      @hours_registry.save!
    end

    @user_id = params[:user_id]
  end

  def update
    @week = Week.find(params[:id])

    if @week.update(week_params)
        hr = HoursRegistry.find(params[:hours_registry][:id])
        hour = params[:hours_registry][:hours_performed].split(":")
        puts ">>>>>>>>>>>>> #{hour}"
        seconds = (hour.first.to_i * 3600) + (hour.second.to_i * 60) + hour.third.to_i

        hr.hours_performed = seconds
        hr.save!
        redirect_to sprint_path(@week.sprint, project: params[:project],
                                user: params[:user_id]),
                    notice: 'Semana atualizada com sucesso'
    else
      render :edit
    end
  end

  protected

  def week_params
      params.require(:week).permit(:id, :expected_hours)
  end
end
