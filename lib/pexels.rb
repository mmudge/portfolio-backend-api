require 'httparty'

class Pexels
  def self.get_photos(amount)
    url = "https://api.pexels.com/v1/search?query=code&per_page=#{amount}"
    response = HTTParty.get(url, headers: { Authorization: Rails.application.credentials.pexels_api_key } )

    # response = {"page"=>1, "per_page"=>1, "photos"=>[{"id"=>169573, "width"=>5472, "height"=>3648, "url"=>"https://www.pexels.com/photo/grayscale-photo-of-computer-laptop-near-white-notebook-and-ceramic-mug-on-table-169573/", "photographer"=>"Negative Space", "photographer_url"=>"https://www.pexels.com/@negativespace", "photographer_id"=>3738, "avg_color"=>"#6E6E6E", "src"=>{"original"=>"https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg", "large2x"=>"https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "large"=>"https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&h=650&w=940", "medium"=>"https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&h=350", "small"=>"https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&h=130", "portrait"=>"https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800", "landscape"=>"https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200", "tiny"=>"https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"}, "liked"=>false}], "total_results"=>901, "next_page"=>"https://api.pexels.com/v1/search/?page=2&per_page=1&query=code"}
    response["photos"]
  end
end
