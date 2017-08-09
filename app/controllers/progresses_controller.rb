class ProgressesController < ApplicationController

  def index
    @project = Project.find(params[:project])
  end

  def new
    @progress = Progress.new
    @project = Project.find(params[:project])
    @completeness = 0

    if MacroActivity.where(project_id: @project.id).present?

      MacroActivity.where(project_id: @project.id).each do |ma|
        @completeness += ma.completeness.to_f
      end

      @completeness = @completeness / MacroActivity.where(project_id: @project.id).count

      # if @project.progresses.present?
      #   @advance = @completeness - @project.progresses.last.completeness.to_f
      # else
      #   @advance = @completeness
      # end

    else
      @completeness = nil
      # @advance = nil
    end

  end

  def create

    @progress = Progress.new(progress_params)
    @project = @progress.project

    if @progress.save

      project = Project.find(params[:progress][:project_id])
      progresses = project.progresses.joins(:sprint).order('sprints.inicio')
      before_p = progresses.joins(:sprint).where('sprints.inicio < ?',
                                               Sprint.find(params[:progress][:sprint_id])
                                               .inicio)
      if before_p.blank?
        @progress.advance = params[:progress][:completeness].to_f
      else
        @progress.advance = params[:progress][:completeness].to_f -
                            before_p.first.completeness.to_f
      end

      @progress.save

      @project.progresses.joins(:sprint).order('sprints.inicio').each do |progress|
        if @project.progresses.joins(:sprint).order('sprints.inicio')
          .where('sprints.inicio < ?', progress.sprint.inicio).present?
          progress.advance = (progress.completeness.to_f -
                              @project.progresses.joins(:sprint)
                              .order('sprints.inicio')
                              .where('sprints.inicio < ?',
                                progress.sprint.inicio).last
                              .completeness.to_f)
                             .round(2)
          progress.save
        else
          progress.advance = progress.completeness.to_f
          progress.save
        end
      end

      redirect_to progresses_path(project: @progress.project),
                  notice: 'Nova completude adicionada com sucesso!'
    else
      render :new
    end

  end

  def destroy
    @progress = Progress.find(params[:id])
    @project = @progress.project
    if @progress.destroy

      @project.progresses.each do |progress|
        if @project.progresses.where('id < ?', progress.id).present?
          progress.advance = (progress.completeness.to_f -
                              progress.project.progresses
                              .where('id < ?', progress.id).last
                              .completeness.to_f)
                             .round(2)
          progress.save
        else
          progress.advance = progress.completeness.to_f
          progress.save
        end
      end

      redirect_to progresses_path(project: @project), notice: 'Progresso excluído com sucesso!'
    else
      redirect_to progresses_path(project: @project), notice: 'Erro ao excluir progresso...'
    end
  end

  private

  def progress_params
    params.require(:progress).permit(:completeness, :project_id, :sprint_id)
  end

end
