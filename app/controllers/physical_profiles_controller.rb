class PhysicalProfilesController < ApplicationController
  before_action :set_physical_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @physical_profiles = PhysicalProfile.all
    respond_with(@physical_profiles)
  end

  def show
    respond_with(@physical_profile)
  end

  def new
    @physical_profile = PhysicalProfile.new
    respond_with(@physical_profile)
  end

  def edit
  end

  def create
    @physical_profile = PhysicalProfile.new(physical_profile_params)
    @physical_profile.save
    respond_with(@physical_profile)
  end

  def update
    @physical_profile.update(physical_profile_params)
    respond_with(@physical_profile)
  end

  def destroy
    @physical_profile.destroy
    respond_with(@physical_profile)
  end

  private
    def set_physical_profile
      @physical_profile = PhysicalProfile.find(params[:id])
    end

    def physical_profile_params
      params.require(:physical_profile).permit(:cpf)
    end
end
