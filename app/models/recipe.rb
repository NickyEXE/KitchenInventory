class Recipe < ApplicationRecord
    belongs_to :ingredient



    # Spoonacular Content


    def self.suggest_recipes
        url = URI("https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{Ingredient.pluck(:name).join(",")}&number=8&ranking=2&ignorePantry=false&apiKey=#{ENV["SPOONACULAR_API_KEY#}"]}")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["cookie"] = '__cfduid=dc9db697c8414ffabb2b8fec54c397c5b1585432169'
        request["content-type"] = 'application/json'
        response = http.request(request)
        return JSON.parse(response.read_body)
    end



    def self.spoonacular_show(id)
        url = URI("https://api.spoonacular.com/recipes/#{id}/information?includeNutrition=false&apiKey=#{ENV["SPOONACULAR_API_KEY"]}")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["content-type"] = 'application/json'

        response = http.request(request)
        return JSON.parse(response.read_body)
    end
end
