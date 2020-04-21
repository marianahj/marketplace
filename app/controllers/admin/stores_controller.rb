class Admin::StoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @stores = Store.where(user_id: current_user.id, status: 1)
  end

  def show
    @store = Store.find(params['id'])
  end

  def edit
    @categories = Store::CATEGORIES.map {|c| c[:name]}
    @store = Store.find(params['id'])
  end

  def update
    attr = store_params
    store = Store.find(params['id'])
    store_attribute_assignment(store, attr)
    store.save
    redirect_to admin_store_path(store.id)
  end

  def new
    @categories = Store::CATEGORIES.map {|c| c[:name]}
  end

  def create
    attr = store_params
    store = Store.new()
    store_attribute_assignment(store, attr)
    track_owner if store.save
    redirect_to admin_store_path(store.id)
  end

  def destroy
    store = Store.find(params['id'])
    store.update_attribute(:status, 0)
    redirect_to admin_store_path(store.id)
  end

  private

  def store_params
    params.permit(:name, :description, :website, :status, :category, :facebook_url, :twitter_url, :instagram_url)
  end

  def store_attribute_assignment(store, attr)
    store.name = attr.fetch(:name)
    store.description = attr.fetch(:description)
    store.website = attr.fetch(:website)
    store.status = attr.fetch(:status)
    store.category = attr.fetch(:category)
    store.facebook_url = attr.fetch(:facebook_url)
    store.twitter_url = attr.fetch(:twitter_url)
    store.instagram_url = attr.fetch(:instagram_url)
    store.user_id = current_user.id
  end

  def track_owner
    user = User.find(current_user.id)
    user.update_attribute(:is_owner, 1)
  end

end
