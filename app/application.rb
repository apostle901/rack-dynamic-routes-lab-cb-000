class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      obj = @@items.select{|baj| baj.name == item_name}
      if obj
        resp.write "#{obj.name} - #{obj.price}"
      else
        resp.write "not here"
        resp.status = 400
      end
    else
      resp.write "Route not found"
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
