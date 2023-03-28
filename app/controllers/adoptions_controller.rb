class AdoptionsController < ApplicationController

    def new
        @tree = Tree.find(params[:id])
        @adoption = Adoption.new(starts_at: Date.today, ends_at: Date.today + 1.year)
    end

    def create
        @tree = Tree.find(params[:id])
        @adoption = Adoption.new(adoption_params)
        @adoption.user = current_user
        @adoption.tree = @tree
        if @adoption.save
            redirect_to tree_path(@tree)
        else
            render :new, status: :unprocessable_entity
        end
    end


    private 

    def adoption_params
        parmas.require(:adoption).require(:name, :starts_at, :ends_at)
    end
end
