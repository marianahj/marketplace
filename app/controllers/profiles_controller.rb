class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    render 'profiles/show'
  end

  def update
    attr = profile_params
    user = User.find(attr['id'])
    user.first_name = attr['first_name']
    user.last_name = attr['last_name']
    address = if user.addresses.any?
                user.addresses.first
              else
                user.addresses.new
    end
    address.street_1 = attr['address_1']
    address.street_2 = attr['address_2']
    address.city = attr['city']
    address.state = attr['state']
    address.postal_code = attr['postal_code']
    user.save
    address.save
    redirect_to 'profiles/show'
  end

  private

  def profile_params
    params.permit(:first_name, :last_name, :address_1, :address_2, :city, :state, :postal_code, :id)
  end
end
