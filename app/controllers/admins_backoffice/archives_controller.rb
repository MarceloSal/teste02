class AdminsBackoffice::ArchivesController < AdminsBackofficeController
    before_action :set_archive, only: %i[ show edit update destroy ]
  
    # GET /drops or /drops.json
    def index
      @archives = Archive.all.page(params[:page])
    end
  
    # GET /drops/1 or /drops/1.json
    def show
    end
  
    # GET /drops/new
    def new
      @archive = Archive.new
    end
  
    # GET /drops/1/edit
    def edit
    end
  
    # POST /drops or /drops.json
    def create
      @archive = Archive.new(archive_params)
  
      respond_to do |format|
        if @archive.save
          format.html { redirect_to admins_backoffice_archives_path(@archive), notice: "Arquivo carregado com sucesso." }
          format.json { render :show, status: :created, location: @archive }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @archive.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /drops/1 or /drops/1.json
    def update
      respond_to do |format|
        if @archive.update(archive_params)
          format.html { redirect_to admins_backoffice_archives_path(@archive), notice: "Arquivo atualizado com sucesso." }
          format.json { render :show, status: :ok, location: @archive }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @archive.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /drops/1 or /drops/1.json
    def destroy
      @archive.destroy
  
      respond_to do |format|
        format.html { redirect_to admins_backoffice_archives_path, notice: "Arquivo deletado com sucesso" }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_archive
        @archive = Archive.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def archive_params
        params.require(:archive).permit(:title, :description, :file)
      end
  end
  