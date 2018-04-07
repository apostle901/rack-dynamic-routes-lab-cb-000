class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)\
      item_name = req.path.split(/items/).last
      if @@items.name.include? (item_name)
        resp.write "#{}"
    else
      resp.write "Path Not Found"
      resp.status = 404
    end
    resp.finish
  end

  def handle_search(item)
    if @@items.include?(item)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
