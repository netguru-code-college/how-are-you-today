# frozen_string_literal: true.

require "open-uri"
class PdfGenerator
  def initialize(image_path, face_api_response = {})
    @response = face_api_response
    @image_path = image_path
  end

  def generate
    pdf = Prawn::Document.new
    pdf.image open(@image_path)
    @response.map do |face|
      pdf.text face.dig('faceAttributes','emotion').sort_by{|k,v| -v}.first(3).to_s
    end
    pdf.render_file Rails.root.join("app/pdfs", "hello.pdf")
  end
end
