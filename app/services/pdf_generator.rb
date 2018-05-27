# frozen_string_literal: true.

require "open-uri"
require "prawn"
class PdfGenerator
  def initialize(image_path, face_api_response = {})
    @response = face_api_response
    @image_path = image_path
  end

  def generate
    pdf = Prawn::Document.new
    cursor = 0
    #pdf.bounding_box([0, cursor], :width => 1000, :height => 1000, ) do 
      pdf.image open(@image_path), :fit => [100, 100], :position => :center
    #end
    @response.map.with_index do |face, index|
      pdf.text "Person #{index} emotions:"
      # pdf.text face.dig('faceAttributes','emotion').sort_by{|k,v| -v}.first(3).to_s

      emotions = face.dig('faceAttributes','emotion').sort_by{|k,v| -v}.first(3)

      pdf.font_size(22)
      pdf.fill_color "FF0000"
      pdf.text "#{emotions[0][0]} with probability #{emotions[0][1]}"

      pdf.font_size(20)
      pdf.fill_color "D7DF01"
      pdf.text "#{emotions[1][0]} with probability #{emotions[1][1]}"

      pdf.font_size(18)
      pdf.fill_color "00FF00"
      pdf.text "#{emotions[2][0]} with probability #{emotions[2][1]}"
    end
    pdf.render_file Rails.root.join("public/pdfs", "hello.pdf")
  end
end
