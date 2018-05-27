require "net/http"

class FaceDetectApiService
    def initialize()
    end

    def call
        # NOTE: You must use the same region in your REST call as you used to obtain your subscription keys.
        #   For example, if you obtained your subscription keys from westcentralus, replace "westus" in the 
        #   URL below with "westcentralus".
        uri = URI("https://westcentralus.api.cognitive.microsoft.com/face/v1.0")
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request["Content-Type"] = "application/json"
        # NOTE: Replace the "Ocp-Apim-Subscription-Key" value with a valid subscription key.
        request["Ocp-Apim-Subscription-Key"] = Rails.application.secrets.emotion_api_key
        # Request body
        request.body = "{\"url\":\"https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&h=350\"}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == "https") do |http|
        http.request(request)
        end

        puts response.body
    end
end
