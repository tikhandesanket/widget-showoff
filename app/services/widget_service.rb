require 'httparty'
require "base64"
class WidgetService
  include HTTParty

  format :json

    # base_uri "http://localhost:4000/api/v1"

   base_uri "https://showoff-rails-react-production.herokuapp.com/api/v1"

  #def initialize(token)
  def initialize
    @options =  {
        headers: {
        # "X-Zingoy-Client" => AppConfig.api_client_id,
        # "Authorization" => "Bearer #{token}",
        "Content-Type" => "application/json",
        "Accept" => "application/json"
    }
    }
  end

  def get_widgets
   # self.class.get("/items", @options)
    self.class.get("/widgets", @options)

    #self.class.get("/carts", @options)

    
  end

  def cart_line_item_list(params_id)
    # self.class.get("/items", @options)

    cart_param = {cart:{:product_id=>params_id}}
    @options.merge!(cart_param)
    self.class.post("/carts", @options)
  end



  def add_to_cart
    p "-------------1"
        self.class.get("/carts/add_to_cart", @options)


  end
end