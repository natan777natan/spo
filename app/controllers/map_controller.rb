class MapController < ApplicationController
    def index
        google_api_key = ENV["GOOGLE_API_KEY"]
        @google_uri = "https://maps.googleapis.com/maps/api/js?key=#{google_api_key}&callback=initMap"
    end
    def map
        google_api_key = ENV["GOOGLE_API_KEY"]
        @google_uri = "https://maps.googleapis.com/maps/api/js?key=#{google_api_key}&callback=initMap"
        # cookies["travel_time"] = nil
        uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+params[:address]+"&key=#{google_api_key}")
        res = HTTP.get(uri).to_s
        # documentに書いてある通りのurlをparams(検索したい文字列)と一緒にgetでAPIにリクエストを送るとjson形式でレスポンス(欲しい情報)が返ってくる。
        # Json https://thinkit.co.jp/article/70/1
        response = JSON.parse(res)
        # puts response
        # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。
        @latlng = []
        @latlng << response["results"][0]["geometry"]["location"]["lat"]
        @latlng << response["results"][0]["geometry"]["location"]["lng"]

        @travel_mode = params[:travel_mode]
        # respond_to以下の記述によって、
        # remote: trueのアクセスに対して、
        # map.js.erbが変えるようになる。
        respond_to do |format| 
            format.js {render layout: false}
        end
    end
end
