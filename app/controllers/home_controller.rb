class HomeController < ApplicationController
    def index
        @title = 'デイトラ'
    end

    def about
        @title = 'デイトラについて'
    end

end