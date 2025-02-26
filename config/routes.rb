Rails.application.routes.draw do
 
  get("/places", { :controller => "places", :action => "index" })
  get("/places/new", { :controller => "places", :action => "new" })
  get("/places/:id", { :controller => "places", :action => "show" })
  post("/places", { :controller => "places", :action => "create" })


  get("/entries/new", { :controller => "entries", :action => "new" })
  post("/entries", { :controller => "entries", :action => "create" })
end

