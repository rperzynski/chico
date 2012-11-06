class ComplaintsController < ApplicationController
 
	before_filter :check_authentication, except: [:index,:show]
def check_authentication
unless session[:user_id]
session[:intended_action] = action_name
session[:intended_controller] = controller_name

      redirect_to new_session_url
    end
  end


 # GET /complaints
  # GET /complaints.json
  def index
    @complaints = @ward.complaints.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @complaints }
    end
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
    @complaint = @ward.complaints.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @complaint }
    end
  end

  # GET /complaints/new
  # GET /complaints/new.json
  def new
    @complaint = @ward.complaints.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @complaint }
    end
  end

  # GET /complaints/1/edit
  def edit
    @complaint = @ward.complaints.find(params[:id])
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @complaint = @ward.complaints.new(params[:complaint])

    respond_to do |format|
      if @complaint.save
        format.html { redirect_to [@ward, @complaint], notice: 'Thank you, your complaint has been submitted.' }
        format.json { render json: @complaint, status: :created, location: @complaint }
      else
        format.html { render action: "new" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /complaints/1
  # PUT /complaints/1.json
  def update
    @complaint = @ward.complaints.find(params[:id])

    respond_to do |format|
      if @complaint.update_attributes(params[:complaint])
        format.html { redirect_to [@ward, @complaint], notice: 'Complaint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint = @ward.complaints.find(params[:id])
    @complaint.destroy

    respond_to do |format|
      format.html { redirect_to ward_complaints_path(@ward) }
      format.json { head :no_content }
    end
  end

	private

		def load_ward
			@ward = Ward.find(params[:ward_id])
		end

end
