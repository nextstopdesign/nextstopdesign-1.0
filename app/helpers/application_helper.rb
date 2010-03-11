# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  
  def stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end

  def title(title) 
    content_for(:title) { title } 
  end
  
  def design_class(design_class) 
    content_for(:design_class) { design_class } 
  end
  
  def keywords(keywords)
    content_for(:keywords) { keywords }
  end 
  
  def description(description)
    content_for(:description) { description }
  end
  
  def show_content(content)
    RedCloth.new(content).to_html unless content.nil?
  end
  
  def show_content_by_permalink(permalink)
    unless permalink.nil?
      @content = Page.find_by_permalink(permalink)
      unless @content.nil?
        if admin?
          @content.content = @content.content + link_to(image_tag("tools/edit_bug.png", { :style => 'margin-left: 8px; position: relative; top: 1px;' }), edit_page_path(@content), { :style => 'border: none;' })
        end
        show_content(@content.content) 
      else
        show_content("<pre>content for " + permalink + " isn't available...</pre>")
      end
    end
  end
  
  def random_image
    image_files = %w( .jpg .gif .png )
    files = Dir.entries(
      "#{RAILS_ROOT}/public/images/" 
    ).delete_if { |x| !image_files.index(x[-4,4]) }
    files[rand(files.length)]
  end  

end
