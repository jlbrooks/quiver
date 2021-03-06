class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /groups
  # GET /groups.json
  def index
    if user_signed_in?
      @groups = current_user.groups
      @user = current_user
    else
      @groups = Groups.all
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # GET /groups/1/adduser
  def adduser
    @group = set_group
  end

  # GET /groups/1/viewuser
  def viewusers
    @group = set_group
  end

  def showgroupposts
    @group = set_group
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.users << current_user
    @group.admins = Array.new
    @group.admins << current_user.id
    @group.save

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  def updateuser
    @user = User.find_by email:(params[:search_user_email])
    @group = set_group
    respond_to do |format|
      if @user 
        if @group.users << @user
            format.html { redirect_to @group, notice: 'User successfully added to the group.' }
            format.json { render :show, status: :ok, location: @group }
        else
            format.html { render :adduser }
            format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @group, notice: 'user does not exist or is already part of the group.' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  def makeadmin
    @user = User.find_by id:(params[:user_id])
    @group = set_group
    if @group.admins.include?(current_user.id)
      respond_to do |format|
        if @user 
          if @group.admins.include?(@user.id) == false
            if @group.admins << @user.id
              format.html { redirect_to @group, notice: 'User successfully admin-ified.' }
              format.json { render :show, status: :ok, location: @group }
              @group.save
            else
              format.html { render :adduser }
              format.json { render json: @group.errors, status: :unprocessable_entity }
            end
          else
            format.html { redirect_to @group, notice: 'User is already an admin.' }
            format.json { render json: @group.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to @group, notice: 'User does not exist.' }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  #DELETE /groups/1
  def removeuser
    @user = User.find_by id:(params[:user_id])
    @group = set_group
    if @group.admins.include?(current_user.id)
      respond_to do |format|
        if @user 
           if @group.users.delete(@user)
                format.html { redirect_to @group, notice: 'user successfully removed from group.' }
                format.json { render :show, status: :ok, location: @group }
            else
                format.html { render :show }
                format.json { render json: @group.errors, status: :unprocessable_entity }
            end
        else
            format.html { redirect_to @group, notice: 'user does not exist or has already been removed.' }
            format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end
end



    # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    if @group.admins.include?(current_user.id)
      @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_url, notice: 'Group was successfully disbanded.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html {redirect_to :back, notice: "you do not have the rights to do that..."}
        format.json {render :show, status: :ok, location: @group}
      end
    end
  end

  # DELETE /groups/1
  def removeadmin
    @user = User.find_by id:(params[:user_id])
    @group = set_group
    if @group.admins.include?(current_user.id)
      respond_to do |format|
        if @group.admins.include?(@user.id)
          if @group.admins.delete(@user.id)
            format.html { redirect_to :back, notice: 'admin rights removed.' }
            format.json { render :back, status: :ok, location: @group }
          else
            format.html { redirect_to :back, notice: 'could not remove admin rights.' }
            format.json { render json: @group.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to @group, notice: 'user does not exist or has already been removed.' }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
      @group.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :description, :users, :admins)
    end
end
