class TracksController < ApplicationController
    before_action :require_user!

    def index
        @tracks = Track.all
    end

    def show
        @track = Track.find(params[:id])
    end

    def new
        @track = Track.new
    end

    def create
        @track = Track.new(track_params)
        if @track.save!
            redirect_to track_path(@track)
        else
            flash.now[:errors] = @track.errors.full_messages
            render :new
        end
    end
    
    def edit
        @track = Track.find(params[:id])
    end

    def update
        @track = Track.find(params[:id])
        if @track.update_attributes(track_params)
            redirect_to track_url(@track)
        else
            flash.now[:errors] = @track.errors.full_messages
            render :edit
        end
    end

    def destroy
        @track = Track.find(params[:id])
        @track.destroy
        redirect_to tracks_path
    end

    private
    def track_params
        params.require(:track).permit(:album_id, :title, :ord, :lyrics, :track_type)
    end
end
