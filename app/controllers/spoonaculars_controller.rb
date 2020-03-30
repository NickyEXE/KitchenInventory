class SpoonacularsController < ApplicationController


    def index
        @recipes = Ingredient.suggest_recipes
    end

    def show
        @recipe = Recipe.spoonacular_show(params[:id])
        byebug
    end


end
