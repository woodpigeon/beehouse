module Admin

  class ProductsController < ApplicationController
    # GET /admin/products
    # GET /admin/products.json
    def index
      @products = Product.all

      respond_to do |format|
        format.html # index.html.erb
      end
    end

    # GET /admin/products/1
    # GET /admin/products/1.json
    def show
      @product = Product.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
      end
    end

    # GET /admin/products/new
    # GET /admin/products/new.json
    def new
      @product = Product.new

      respond_to do |format|
        format.html # new.html.erb
      end
    end

    # GET /admin/products/1/edit
    def edit
      @product = Product.find(params[:id])
    end

    # POST /admin/products
    # POST /admin/products.json
    def create
      @product = Product.new(params[:product])

      respond_to do |format|
        if @product.save
          format.html { redirect_to [:admin,@product], notice: 'Product was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end

    # PUT /admin/products/1
    # PUT /admin/products/1.json
    def update
      @product = Product.find(params[:id])

      respond_to do |format|
        if @product.update_attributes(params[:product])
          format.html { redirect_to [:admin,@product], notice: 'Product was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      end
    end

    # DELETE /admin/products/1
    # DELETE /admin/products/1.json
    def destroy
      @product = Product.find(params[:id])
      @product.destroy

      respond_to do |format|
        format.html { redirect_to admin_products_url }
      end
    end
  end
end
