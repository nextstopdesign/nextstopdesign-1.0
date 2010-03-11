xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Next Stop Design"
    xml.description "New designs feed for Nextstopdesigns.com"
    xml.link formatted_designs_url(:rss)
    
    for design in @designs
      xml.item do
        xml.title design.title
        xml.description design.description
        xml.pubDate design.created_at.to_s(:rfc822)
        xml.link url_for(:controller => 'designs', :action => 'show', :id => design.id, :only_path => false, :format => nil)
        xml.guid url_for(:controller => 'designs', :action => 'show', :id => design.id, :only_path => false, :format => nil)
      end
    end
  end
end
