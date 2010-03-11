xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Next Stop Design"
    xml.description "New ideas feed for Nextstopdesigns.com"
    xml.link formatted_ideas_url(:rss)
    
    for idea in @ideas
      xml.item do
        xml.title "Idea"
        xml.description idea.idea
        xml.pubDate idea.created_at.to_s(:rfc822)
        xml.link url_for(:controller => 'ideas', :action => 'show', :id => idea.id, :only_path => false, :format => nil)
        xml.guid url_for(:controller => 'ideas', :action => 'show', :id => idea.id, :only_path => false, :format => nil)
      end
    end
  end
end
