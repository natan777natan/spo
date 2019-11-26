class MusicController < ApplicationController
    def index
        params[:travel_time]
        spotify_client_id = ENV["SPOTIFY_CLIENT_ID"]
        spotify_secret_id = ENV["SPOTIFY_SECRET_ID"]
        RSpotify.authenticate(spotify_client_id, spotify_secret_id)
        current_artist = current_user.artist
        gon.current_artist = current_artist
        @genre = current_user.genre
        gon.genre = @genre

        
        if current_artist.present?
            # アルバム検索するとき-------------------
            search_artists = RSpotify::Artist.search(current_artist)
            @artist = search_artists.first
            albums = @artist.albums
            tracks = []
            albums[0..3].each do |album|
                tracks << album.tracks
            end
            tracks.flatten!            
            @sort_by_popularity_tracks = tracks.sort_by{|track| track.popularity}.reverse
            #アルバムに入っている複数の曲のJSON
            gon.recommendations_track_ids_json = @sort_by_popularity_tracks.to_json
        elsif @genre.present? && @artist.blank?
            # ジャンル検索-------------------
            recommendations = RSpotify::Recommendations.generate(limit:100, seed_genres: [@genre])
            recommendations_tracks = recommendations.tracks
            recommendations_tracks = recommendations_tracks
            @sort_by_popularity_tracks  = recommendations_tracks.sort_by{|recommendations_track| recommendations_track.popularity}.reverse
            @sort_by_popularity_tracks = @sort_by_popularity_tracks            
            gon.recommendations_track_ids_json = @sort_by_popularity_tracks.to_json 
        else
            redirect_to user_path(current_user.id)
        end
        

        #travel_timejsからrailsに渡す
        params_travel_time = params[:travel_time].to_i
        @travel_time = params_travel_time
        gon.travel_time = @travel_time
        @sum_duration = 0
    end
    #def music
        #params[:travel_time]
    #end

end
