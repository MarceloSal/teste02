class AdminsBackoffice::MembersController < AdminsBackofficeController
  before_action :set_member, only: %i[ show edit update destroy ]
  
  # GET /drops or /drops.json
  def index
    @members = Member.all.page(params[:page])
  end

  # GET /drops/1 or /drops/1.json
  def show
  end

  # GET /drops/new
  def new
    @member = Member.new
  end

  # GET /drops/1/edit
  def edit
  end

  # POST /drops or /drops.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to admins_backoffice_members_path(@member), notice: "Membro carregado com sucesso." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drops/1 or /drops/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to admins_backoffice_members_path(@member), notice: "Membro atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drops/1 or /drops/1.json
  def destroy
    @member.destroy

    respond_to do |format|
      format.html { redirect_to admins_backoffice_members_path, notice: "Membro deletado com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:avatar, :first_name, :last_name, :email, :cell_phone, :birthdate, :address)
    end

    
      
end
