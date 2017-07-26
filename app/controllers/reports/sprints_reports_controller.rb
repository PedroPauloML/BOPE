class Reports::SprintsReportsController < ReportsController
  def index
  end

  def relative_dedication
    respond_to do |format|
      format.pdf do
        render pdf: "report_#{Project.find(params[:project]).description}",
               disposition: "inline",
               template: "reports/sprints_reports/relative_dedication.html.erb",
               orientation: 'Landscape',
               layout: "reports/weeks_reports",
               locals: { :@project => Project.find(params[:project]),
                         :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] },
               page_size: 'A4',
               encoding: 'utf8'
      end
      format.html do
        render template: "reports/sprints_reports/relative_dedication.html.erb",
               layout: "reports/weeks_reports",
               locals: { :@project => Project.find(params[:project]),
                         :@sprint => Sprint.find(params[:sprint]),
                         :@observation => params[:observation] }
       end
    end
  end

  def activities_list
    respond_to do |format|
      format.pdf do
        render pdf: "report_#{Sprint.find(params[:sprint]).description}",
               disposition: "inline",
               template: "reports/sprints_reports/activities_list.html.erb",
               orientation: 'Landscape',
               layout: "reports/weeks_reports",
               locals: { :@sprint => Sprint.find(params[:sprint]) },
               page_size: 'A4',
               encoding: 'utf8'
      end
      format.html do
        render template: "reports/sprints_reports/activities_list.html.erb",
               layout: "reports/weeks_reports",
               locals: { :@sprint => Sprint.find(params[:sprint]) }
       end
    end
  end
end
