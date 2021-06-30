require 'pry'

class BillsController < ApplicationController
  before_action :set_bill, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create ]
  before_action :set_user, only: %i[ new create ]

  # GET /bills or /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1 or /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills or /bills.json
  def create
    @bill = Bill.new(bill_params)
    @bill.user_id = @user.id
    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: "Bill was successfully created." }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1 or /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: "Bill was successfully updated." }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1 or /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: "Bill was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def scrape
    search_type = attr_breadcrumb(params[:choice]).to_s
    url = 'https://sapl.camaranh.rs.gov.br/materia/pesquisar-materia?tipo=' + search_type
    @response = Scraper.parse(url)
    if @response.empty? && @response[:error].nil?
      flash.now[:alert] = response[:error]
    else
      flash.now[:notice] = "Successfully scraped website"
    end
    rescue StandardError => e
      flash.now[:alert] = "Error: #{e}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    def attr_breadcrumb(type)
      case type
      when "Emenda"
        return 24
      when "Indicação/Pedido de Providências"
        return 8
      when "Moção"
        return 7
      when "Projeto de Decreto Legislativo"
        return 6
      when "Projeto de Emenda à Lei Orgânica Municipal"
        return 9
      when "Projeto de Lei"
        return 1
      when "Projeto de Lei Complementar"
        return 5
      when "Projeto de Lei Orgânica Municipal"
        return 18
      when "Projeto de Resolução"
        return 2
      when "Projeto de Sugestão"
        return 20
      when "Requerimento"
        return 3
      when "Substitutivo"
        return 25
      when "Veto" 
        return 21
      end
    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:title, :summary, :timestamp, :author, :localization, :status, :expiration_date, :last_process_date, :last_process, :attachment_docs, :link)
    end

    def serialized_params
      params.require(:bill).permit(:bill, :authenticity_token)
    end

    def set_user
      @user = current_user
    end
end
