class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @product = Product.new
    @disk = @product.disks.build
    @sing = @disk.sings.build
    @artist = @product.artists.build
    @label = @product.labels.build
    @genre = @product.genres.build
    @jaket = @product.jakets.build
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_product_path(@product.id)
    else
      render "new"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admins_product_path(@product.id)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admins_products_path
  end

  private
  def product_params
    params.require(:product).permit(:format, :title, :stock, :status, :price, disks_attributes: [:id, :disk_name, :product_id, :_destroy, sings_attributes: [:id, :disk_id, :sing_name, :sing_order, :_destroy]], artist_products_attributes: [:id, :product_id, :artist_id, :_destroy, artist_attributes: [:id, :artist_name, :destroy]], labels_attributes: [:id, :product_id, :label_name, :_destroy], genre_products_attributes: [:id, :product_id, :genre_id, :_destroy, genre_attributes: [:id, :genre_name, :_destroy]], jakets_attributes: [:id, :image, :product_id, :_destroy])
  end

  def artist_params
    params.require(:artist).permit(:artist_name)
  end

end
