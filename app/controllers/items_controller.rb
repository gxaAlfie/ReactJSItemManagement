class ItemsController < BaseController
  def index
    respond_with Item.all
  end
  
  def create
    respond_with Item.create(item_params)
  end
  
  def destroy
    respond_with Item.destroy(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
    item.update_attributes(item_params)
    respond_with item, json: item
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :description)
  end
end