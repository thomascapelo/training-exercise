class TreesController < ApplicationController
before_action :set_tree, only: [:show, :edit, :update, :destroy]
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
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @adoption = Adoption.new
    end

    def edit 
    end

    def update
        @tree.update(tree_params)
        redirect_to tree_path(@tree)
    end

    def destroy
        if @tree.user == current_user
            @tree.destroy
            redirect_to trees_path
        else
            flash[:error] = "You can't delete someone else's tree!"
            redirect_to @tree
        end
    end

    private

    def tree_params
        params.require(:tree).permit(:name, :address, :fruit_type, :description, :price_per_year, :quantity_per_year)
    end

    def set_tree
        @tree = Tree.find(params[:id])
    end
end
