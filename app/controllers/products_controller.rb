class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
       #@products = Product.all
    @products = Product.page(params[:page]).per(2) #page-is helper method 
                        #which tells to product which page want
                        #per- is also helper method which define how many page want in each page


    @search = Product.search(params[:q]) #here we make a search object by calling
             #Product.seach , and passing a parameter 'q' (which holds d hash of seaching parameter
              # that a user pass to it)
    @productss = @search.result  #To get d the founded products, we call 'result' on this object.
                 #and store d founded product into a var name as '@products' only othrwise it give error
     #here search field is not working becoz i gave wrong var name '@products' shld be there to work but to work  pagination
     #but to work paginate i change d var name bcz both together won't work tht is paginate and search not work together 
  end

  # GET /products/1
  # GET /products/1.json
  def show
   end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image)
    end
end
