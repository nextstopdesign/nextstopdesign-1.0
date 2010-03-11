xml.instruct!
 xml.photos(:title => "Top Rated Designs", :description => "") do
   @top_designs.each do |design|
     xml.photo(:desc => design.title, :url => design.photo1.url(:email)) do      
   end
end
end