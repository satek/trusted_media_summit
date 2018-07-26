class ImageProcessingController < ApplicationController
  skip_before_action :verify_authenticity_token

  rescue_from(ActionController::ParameterMissing) do |ex|
    render plain:  "Required parameter missing: #{ex.param}", status: :bad_request
  end

  def index
    required_params = ["imageData", "x", "y", "width", "height", "scaleX", "scaleY", "rotate"]
    permitted_params = required_params + ["lang"]
    image_params = params.require(required_params).permit(permitted_params).to_h
    image_params['lang'] = 'en' unless image_params['lang']
    res = HTTParty.post('http://35.240.162.62:9000', body: image_params.to_json)
    render plain: res
  end
end
