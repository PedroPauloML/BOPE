class Reports::WeeksReportsController < ReportsController

  def index

  end

  def relative_dedication
    respond_to do |format|
      format.pdf do
        render pdf: "report #{Project.find(params[:project]).description}",
               disposition: "inline",
               template: "reports/weeks_reports/relative_dedication.html.erb",
               orientation: 'Landscape',
               layout: "reports/weeks_reports",
               locals: { :@project => Project.find(params[:project]),
                         :@sprint => Sprint.find(params[:project]),
                         :@observation => params[:observation] },
               page_size: 'A4',
               encoding: 'utf8'
      end
      format.html do
        render template: "reports/weeks_reports/relative_dedication.html.erb",
               layout: "reports/weeks_reports",
               locals: { :@project => Project.find(params[:project]),
                         :@sprint => Sprint.find(params[:project]),
                         :@observation => params[:observation] }
       end
    end
  end

end