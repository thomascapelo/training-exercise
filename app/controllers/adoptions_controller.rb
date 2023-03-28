class AdoptionsController < ApplicationController

    def new
        @tree = Tree.find(params[:id])
        @adoption = Adoption.new()
    end

    def create
        @tree = Tree.find(params[:tree_id])
        @adoption = Adoption.new(adoption_params)
        @adoption.starts_at = DateTime.now
        @adoption.ends_at = DateTime.now + 1.year
        @adoption.user = current_user
        @adoption.tree = @tree
        if @adoption.save!
            redirect_to tree_path(@tree)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def index
        @adoptions = current_user.adoptions 
    end


    private 

    def adoption_params
        params.require(:adoption).permit(:name)
    end
end
