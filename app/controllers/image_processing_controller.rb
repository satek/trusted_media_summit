require "google/cloud/translate"
require "google/cloud/vision"

class ImageProcessingController < ApplicationController
  skip_before_action :verify_authenticity_token

  rescue_from(ActionController::ParameterMissing) do |ex|
    render plain:  "Required parameter missing: #{ex.param}", status: :bad_request
  end

  rescue_from(Net::ReadTimeout) do |ex|
    render plain:  "Service timeout", status: 500
  end

  PERMITTED_PARAMS = %w[imageData x y width height scaleX scaleY rotate lang]

  def index
    image_name = save_image
    Rails.logger.info("IMG saved: #{image_name}")
    image_params = extract_image_params
    image_params['imageLocation'] = "#{request.env['HTTP_HOST']}/#{image_name}"
    res = HTTParty.post('http://35.240.162.62:9000', body: image_params.to_json)
    render plain: res
  end

  def language_list
    languages = google_translate.languages.map(&:code)
    render json: languages
  end

  def translate
    text = params.require(:text)
    from = params.require(:from)
    to = params.require(:to)
    render plain: google_translate.translate(text, from: from, to: to)
  end

  def text_extraction
    image_name = save_image
    path = Rails.root.join('public', image_name).to_s
    image = google_vision.image(path)
    image.context.languages = Array(params.require(:lang))
    doc = image.document
    render json: { text: doc.text }
  end

  private

  def image_digest
    Digest::SHA256.hexdigest(params['imageData'])
  end

  def save_image
    img = Base64.decode64(params['imageData'])
    name = "images/#{image_digest}.jpg"
    File.open(Rails.root.join('public', name), 'wb')
        .tap { |fl| fl.write(img) }
    name
  end

  def google_vision
    @google_vision ||= Google::Cloud::Vision.new
  end

  def google_translate
    @google_translate ||= Google::Cloud::Translate.new
  end

  def extract_image_params
    params.select { |k, _| PERMITTED_PARAMS.include?(k) }
      .permit(PERMITTED_PARAMS).tap do |permitted|
        permitted['lang'] = 'en' unless permitted['lang']
      end
  end
end
