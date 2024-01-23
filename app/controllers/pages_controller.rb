class PagesController < ApplicationController
    def home
			@articles = Article.last(4).reverse
    end

    def about
    end
end
