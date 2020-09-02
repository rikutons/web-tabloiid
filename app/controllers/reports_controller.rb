class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.paginate(page: params[:page], per_page: 8)
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # POST /reports
  # POST /reports.json
  def create
    puts "\n"
    date = Time.now()
    unix_time = date.to_i()
    file_name = params[:pdf_file].original_filename.chomp('.pdf')
    file_path_name = "#{unix_time}_#{file_name}"
    image_path_name = "#{unix_time}_#{params[:image_file].original_filename}"
    @report = Report.new(file_name: file_name,
      file_path: "pdf/#{file_path_name}.pdf",
      date: date,
      password: params[:password],
      image_path: "images/#{image_path_name}")

    File.binwrite("public/pdf/#{file_path_name}.pdf", params[:pdf_file].read)
    File.binwrite("public/images/#{image_path_name}", params[:image_file].read)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
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
