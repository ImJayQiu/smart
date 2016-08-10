class CoutlinesController < ApplicationController

	require "csv"

	layout "data"


  before_action :set_coutline, only: [:show, :edit, :update, :destroy]

  # GET /coutlines
  # GET /coutlines.json
  def index
    @coutlines = Coutline.all
  end

  # GET /coutlines/1
  # GET /coutlines/1.json
  def show
  end

  def import 
  end

  def imported 

		csv_file = params[:file]

		@csv_file = File.read(csv_file.tempfile.to_path.to_s, encoding: "UTF-8")

		import = ImportCoutline.new(content: @csv_file)

		import.run!

		@valid_header = import.valid_header?  # => false
		@message = import.report.message # => "The following columns are required: email"
		@error = import.report.invalid_rows.map { |row| [row.model, row.errors] }
		@report = import.report.success? # => true


  end

  # GET /coutlines/new
  #
  def new
    @coutline = Coutline.new
  end

  # GET /coutlines/1/edit
  def edit
  end

  # POST /coutlines
  # POST /coutlines.json
  def create
    @coutline = Coutline.new(coutline_params)

    respond_to do |format|
      if @coutline.save
        format.html { redirect_to @coutline, notice: 'Coutline was successfully created.' }
        format.json { render :show, status: :created, location: @coutline }
      else
        format.html { render :new }
        format.json { render json: @coutline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coutlines/1
  # PATCH/PUT /coutlines/1.json
  def update
    respond_to do |format|
      if @coutline.update(coutline_params)
        format.html { redirect_to @coutline, notice: 'Coutline was successfully updated.' }
        format.json { render :show, status: :ok, location: @coutline }
      else
        format.html { render :edit }
        format.json { render json: @coutline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coutlines/1
  # DELETE /coutlines/1.json
  def destroy
    @coutline.destroy
    respond_to do |format|
      format.html { redirect_to coutlines_url, notice: 'Coutline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coutline
      @coutline = Coutline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coutline_params
      params.require(:coutline).permit(:code, :ename, :name, :des, :major, :ctype)
    end
end
