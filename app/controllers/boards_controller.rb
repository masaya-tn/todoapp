class BoardsController < ApplicationController
    
    def index
      @boards = Board.all
    end

    def new
      @board = User.boards.build
    end
end