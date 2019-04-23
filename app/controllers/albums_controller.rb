class AlbumsController < ApplicationController
    before_action :require_user!
    
    def index
        @albums = Album.all
    end

    def show
        @album = Album.find(params[:id])
    end

    def new
        @album = Album.new
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_path(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end
    
    def edit
        @album = Album.find(params[:id])
    end

    def update
        @album = Album.find(params[:id])
        if @album.update_attributes(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit
        end
    end

    def destroy
        @album = Album.find(params[:id])
        @album.destroy
        redirect_to albums_path
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :band_id, :is_studio)
    end
end
