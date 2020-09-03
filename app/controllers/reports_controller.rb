class ReportsController < ApplicationController
  before_action :set_report, only: :destroy

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.paginate(page: params[:page], per_page: 8)
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # POST /reports
  # POST /reports.json
  def create
    date = Time.now()
    unix_time = date.to_i()
    file_name = params[:pdf_file].original_filename.chomp('.pdf')
    file_path_name = "pdf/#{unix_time}.pdf"
    image_path_name = ""
    File.binwrite("public/#{file_path_name}", params[:pdf_file].read)

    unless params[:image_file].nil?
      image_path_name = "images/#{unix_time}"
      File.binwrite("public/#{image_path_name}", params[:image_file].read)
    end

    @report = Report.new(file_name: file_name,
      file_path: "#{file_path_name}",
      date: date,
      password: params[:password],
      image_path: "#{image_path_name}")


    respond_to do |format|
      if @report.save
        format.html { redirect_to root_path }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    File.delete("public/#{@report[:file_path]}")
    unless @report[:image_path].empty?
      File.delete("public/#{@report[:image_path]}")
    end 
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end
end
