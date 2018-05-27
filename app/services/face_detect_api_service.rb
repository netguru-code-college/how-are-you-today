require "net/http"

class FaceDetectApiService
  def initialize(image_path)
    @image_path = image_path
  end

  def call
    uri = URI("https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect")
    uri.query = URI.encode_www_form({
        'returnFaceId' => 'true',
        'returnFaceLandmarks' => 'false',
        'returnFaceAttributes' => 'emotion,age,gender',
        'scores' => 'true'
    })

    request = Net::HTTP::Post.new(uri.request_uri)
    request["Content-Type"] = "application/json"
    request["Ocp-Apim-Subscription-Key"] = Rails.application.secrets.emotion_api_key

    request.body = "{\"url\":\"#{@image_path}\"}"
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end
    result = JSON.parse(response.body)
  end
end
