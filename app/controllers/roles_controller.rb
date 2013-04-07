class RolesController < ApplicationController
  load_and_authorize_resource
  
  

	def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
    @categories = [name: "Donor", name: "Ministry", name: "Co-Operatives", name: "GAL"]
  end

  def create
    @role = Role.new(params[:role])

    if @role.save
      redirect_to roles_path, flash: { success: 'Role saved successfully' }
    else
      render action: 'edit'
    end
  end

  def edit
    @role = Role.find(params[:id])
    @categories = ["Donor", "Ministry", "Co-Operatives", "GAL"]
  end

  def update
    @role = Role.find(params[:id])

    if @role.update_attributes(params[:role])
      redirect_to roles_path, flash: { success: 'Role successfully updated'}
    else
      render action: 'edit'
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to roles_path, flash: { success: 'Role successfully deleted' }
  end
end
