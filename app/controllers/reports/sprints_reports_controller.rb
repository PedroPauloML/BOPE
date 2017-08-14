class Reports::SprintsReportsController < ReportsController
  def index
  end

  def relative_dedication
    respond_to do |format|
      format.pdf do
        render pdf: "report",
               disposition: "inline",
               template: "reports/sprints_reports/relative_dedication.html.erb",
               orientation: 'Landscape',
               layout: "report_pdf",
               locals: { :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] },
               page_size: 'A4',
               encoding: 'utf8'
      end
      format.html do
        render template: "reports/sprints_reports/relative_dedication.html.erb",
               layout: "report_pdf",
               locals: { :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] }
       end
    end
  end

  def activities_list
    respond_to do |format|
      format.pdf do
        render pdf: "report",
               disposition: "inline",
               template: "reports/sprints_reports/activities_list.html.erb",
               orientation: 'Landscape',
               layout: "report_pdf",
               locals: { :@observation => params[:observation] },
               page_size: 'A4',
               encoding: 'utf8'
      end
      format.html do
        render template: "reports/sprints_reports/activities_list.html.erb",
               layout: "report_pdf",
               locals: { :@observation => params[:observation] }
       end
    end
  end

  def advance_and_completeness
    respond_to do |format|
      format.pdf do
        render pdf: "report",
               disposition: "inline",
               template: "reports/sprints_reports/advance_and_completeness.html.erb",
               orientation: 'Landscape',
               layout: "report_pdf",
               locals: { :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] },
               page_size: 'A4',
               encoding: 'utf8'
      end
      format.html do
        render template: "reports/sprints_reports/advance_and_completeness.html.erb",
               layout: "report_pdf",
               locals: { :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] }
       end
    end
  end

  def team_monitoring
    respond_to do |format|
      format.pdf do
        render pdf: "report_#{Sprint.find(params[:sprint]).description}",
               disposition: "inline",
               template: "reports/sprints_reports/team_monitoring.html.erb",
               layout: "report_pdf",
               locals: { :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] },
               page_size: 'A4',
               encoding: 'utf8'
      end
      format.html do
        render template: "reports/sprints_reports/team_monitoring.html.erb",
               layout: "report_pdf",
               locals: { :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] }
       end
    end
  end

  def relative_productivity
    respond_to do |format|
      format.pdf do
        render pdf: "report",
               disposition: "inline",
               template: "reports/sprints_reports/relative_productivity.html.erb",
               orientation: 'Landscape',
               layout: "report_pdf",
               locals: { :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] },
               page_size: 'A4',
               encoding: 'utf8'
      end
      format.html do
        render template: "reports/sprints_reports/relative_productivity.html.erb",
               layout: "report_pdf",
               locals: { :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] }
       end
    end
  end

  def relative_velocity
    respond_to do |format|
      format.pdf do
        render pdf: "report",
               disposition: "inline",
               template: "reports/sprints_reports/relative_velocity.html.erb",
               orientation: 'Landscape',
               layout: "report_pdf",
               locals: { :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] },
               page_size: 'A4',
               encoding: 'utf8'
      end
      format.html do
        render template: "reports/sprints_reports/relative_velocity.html.erb",
               layout: "report_pdf",
               locals: { :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] }
       end
    end
  end
end
