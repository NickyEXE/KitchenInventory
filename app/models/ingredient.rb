class Ingredient < ApplicationRecord
    has_many :recipes

    def print_kind
        if self.sub_kind = "none"
            return self.kind
        end
        return self.kind + " - " + self.sub_kind
    end

    def get_recipes_if_not_searched
        if !self.nyt_searched
            results = scrape_times
            make_recipes(results)
        end
        return self.recipes
    end

    def scrape_times
        require 'open-uri'
        Nokogiri::HTML(open("https://cooking.nytimes.com/search?q=#{self.name}"))
    end
    
    def make_recipes(results)
        cards = results.css(".recipe-card")
        cards.each do |card|
            begin
                recipe = self.recipes.find_or_initialize_by(name: card.at_css(".name")["data-name"])
                recipe["thumbnail"] = card.at_css(".image").at_css("img").attributes["data-src"].value
                recipe["image"] = card.at_css(".image").at_css("img").attributes["data-pin-media"].value
                recipe["url"] = "https://cooking.nytimes.com/" + card.at_css(".card-info-wrapper").at_css(".card-link")["href"]
                recipe["byline"] = card.at_css(".card-byline").text
                recipe["cooking_time"] = card.at_css(".cooking-time").text
                recipe.save
            rescue
            end
        end
    end
end
