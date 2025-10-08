class TrimestersController < ApplicationController
    before_action :set_trimester, only: %i[ show edit update destroy ]
    before_action :require_admin, only: %i[ create update destroy ]

    def index
        @trimesters = Trimester.all
    end

    # GET /trimesters/1
    def show
        @trimester = Trimester.find(params[:id])
    end

    def new
        @trimester = Trimester.new
    end

    # GET /trimesters/1/edit
    def edit
    end


    # POST /trimesters or /trimesters.json
    def create
        @trimester = Trimester.new(trimester_params)

        respond_to do |format|
            if @trimester.save
                format.html { redirect_to @trimester, notice: "Trimester was successfully created." }
                format.json { render :show, status: :created, location: @trimester }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @trimester.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /trimesters/1 or /trimesters/1.json
    def update
        respond_to do |format|
            #check if deadline blank
            if params[:application_deadline].blank?
                format.html {render :edit, status: :bad_request}
                format.json {render json: @trimester.errors, status: :bad_request}
            end
            
            if @trimester.update(trimester_params)
                format.html { redirect_to @trimester, notice: "Trimester was successfully updated." }
                format.json { render :show, status: :ok, location: @trimester }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @trimester.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /trimesters/1 or /trimesters/1.json
    def destroy
        @trimester.destroy!

        respond_to do |format|
        format.html { redirect_to trimesters_path, status: :see_other, notice: "Trimester was successfully destroyed." }
        format.json { head :no_content }
        end
    end


    private
    
    def set_trimester
        @trimester = Trimester.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def trimester_params
        params.expect(trimester: [ :term, :year, :start_date, :end_date, :application_deadline ])
    end
end
