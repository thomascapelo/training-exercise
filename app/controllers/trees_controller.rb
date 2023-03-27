class TreesController < ApplicationController

    def index
        @trees = Tree.all
    end

    def new
        @tree = Tree.new
    end

    def create
        @tree = Tree.new(tree_params)
        @tree.user = current_user
        if @tree.save
            redirect_to tree_path(@tree)
        else
            render :status, :unprocessable_entity
        end
    end

    def show
        @tree = Tree.find(params[:id])
    end

    private

    def tree_params
        params.require(:tree).permit(:name, :address, :fruit_type, :description, :price_per_year, :quantity_per_year)
    end
end
