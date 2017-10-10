#This is movies_controller.rb
class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end

	def show
		id = params[:id] #retrieve movie ID from URI route
		@movie = Movie.find(id) #look up movie by unique ID
		#renders app/views/movies.show.html.haml by default
	end
	
	def new
		@movie = Movie.new
		#default: render new template
	end
	
def create
    #@movie = Movie.create!(params[:movie]) #old way
    @movie = Movie.create!(movie_params)  # new way
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

	
	private
	
		def movie_params
    		params.require(:movie).permit(:title, :rating, :description, :release_date)
		end
end
