class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @address = @user.addresses.first
    render 'profiles/show'
  end

  def edit
    @user = current_user
    @address = @user.addresses.first
  end

  def update
    attr = profile_params
    user = User.find(attr['id'])
    user.first_name = attr['first_name']
    user.last_name = attr['last_name']
    user.save
    update_address(attr)
    redirect_to profile_path(user.id)
  end

  private

  def profile_params
    params.permit(:first_name, :last_name, :street_1, :street_2, :city, :state, :postal_code, :id)
  end

  def update_address(attr)
    address = Address.find_by_user_id(attr['id']) || Address.new
    address.user_id = attr['id']
    address.street_1 = attr['street_1']
    address.street_2 = attr['street_2']
    address.city = attr['city']
    address.state = attr['state']
    address.postal_code = attr['postal_code']
    address.save
  end
end
