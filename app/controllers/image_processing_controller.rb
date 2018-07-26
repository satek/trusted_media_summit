class ImageProcessingController < ApplicationController
  skip_before_action :verify_authenticity_token

  rescue_from(ActionController::ParameterMissing) do |ex|
    render plain:  "Required parameter missing: #{ex.param}", status: :bad_request
  end

  PERMITTED_PARAMS = %w[imageData x y width height scaleX scaleY rotate lang]

  def index
    res = HTTParty.post('http://35.240.162.62:9000', body: image_params.to_json)
    render plain: res
  end

  private

  def image_params
    params.select { |k, _| PERMITTED_PARAMS.include?(k) }
      .permit(PERMITTED_PARAMS).tap do |permitted|
        permitted['lang'] = 'en' unless permitted['lang']
      end
  end
end
