class ItemsController < ApplicationController

  def new
    @item = Item.new
    @category = []
    Category.where(ancestry: nil).each do |parent|
    @category << parent
    end
  end

  def category_children
    console.log("ssssssssss")
    @category_children = Category.find_by(name: "#{params[:name]}", ancestry: nil).children
  end

  def create
    Item.create(item_params)
  end

  private
    def item_params
      params.require(:item).permit(:product_name, :product_text, :price)
end

end