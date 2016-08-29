class WbCsvLinesController < ApplicationController
  before_action :set_wb_csv_line, only: [:show, :edit, :update, :destroy]

  # GET /wb_csv_lines
  # GET /wb_csv_lines.json
  def index
    @wb_csv_lines = WbCsvLine.all
  end

  # GET /wb_csv_lines/1
  # GET /wb_csv_lines/1.json
  def show
  end

  # GET /wb_csv_lines/new
  def new
    @wb_csv_line = WbCsvLine.new
  end

  # GET /wb_csv_lines/1/edit
  def edit
  end

  # POST /wb_csv_lines
  # POST /wb_csv_lines.json
  def create
    @wb_csv_line = WbCsvLine.new(wb_csv_line_params)

    respond_to do |format|
      if @wb_csv_line.save
        format.html { redirect_to @wb_csv_line, notice: 'Wb csv line was successfully created.' }
        format.json { render :show, status: :created, location: @wb_csv_line }
      else
        format.html { render :new }
        format.json { render json: @wb_csv_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wb_csv_lines/1
  # PATCH/PUT /wb_csv_lines/1.json
  def update
    respond_to do |format|
      if @wb_csv_line.update(wb_csv_line_params)
        format.html { redirect_to @wb_csv_line, notice: 'Wb csv line was successfully updated.' }
        format.json { render :show, status: :ok, location: @wb_csv_line }
      else
        format.html { render :edit }
        format.json { render json: @wb_csv_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wb_csv_lines/1
  # DELETE /wb_csv_lines/1.json
  def destroy
    @wb_csv_line.destroy
    respond_to do |format|
      format.html { redirect_to wb_csv_lines_url, notice: 'Wb csv line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wb_csv_line
      @wb_csv_line = WbCsvLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wb_csv_line_params
      params.require(:wb_csv_line).permit(:code, :ocode, :arrival, :departure, :received, :name, :phone, :email, :price, :roomn, :status, :origin)
    end
end
