require "erb"

class Greeter
  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when "/" then Rack::Response.new(render("index.html.erb"))
    when "/change" then Rack::Response.new(request.params["name"])
    else  Rack::Response.new("Not Found", 404)
    end
    # [200, {"Content-Type" => "text/plain"}, ["Hello Rack Rack"]]
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end