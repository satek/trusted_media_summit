class ImageProcessingController < ApplicationController
  skip_before_action :verify_authenticity_token

  EXAMPLE_JSON = '{"full_matches":[],"best_guess":["hitler propaganda"],"partial_matches":[{"image_url":"https://www.thesun.co.uk/wp-content/uploads/2017/03/dd-composite-hitler-propaganda-pics.jpg","unix_time":1532577175.0}],"similar_images":[{"image_url":"https://rehmat1.files.wordpress.com/2014/05/modi_hitler1.jpg","unix_time":1400760738.0},{"image_url":"https://bilder.bild.de/fotos-skaliert/postkarten-als-propaganda-gerhard-bartels-war-hitlers-fotojunge-41062398/1,w=993,q=high,c=0.bild.jpg","unix_time":1433627599.0},{"image_url":"http://assets.nydailynews.com/polopoly_fs/1.1367211.1370762340!/img/httpImage/image.jpg_gen/derivatives/article_750/nazi9n-14-copy.jpg","unix_time":1370762373.0},{"image_url":"https://ww2gravestone.com/wp-content/uploads/2016/09/Brainiac239Art.jpg","unix_time":1487739600.0},{"image_url":"https://farm9.static.flickr.com/8270/29803433923_80cb59c101_b.jpg","unix_time":1476910447.0}]}'

  def index
    permited_params = ["imageData", "x", "y", "width", "height", "scaleX", "scaleY", "rotate"]
    image_params = params.permit(permited_params).to_h
    res = HTTParty.post('http://35.240.162.62:9000', body: image_params.to_json)
    render text: res
  end
end
