module SummarizeTags
  
  include Radiant::Taggable
    
  desc "Truncate content following this keyword: '!more!'" 
  tag "content" do |tag|
    page = tag.locals.page
    part_name = tag_part_name(tag)
    boolean_attr = proc do |attribute_name, default|
      attribute = (tag.attr[attribute_name] || default).to_s
      raise TagError.new(%{`#{attribute_name}' attribute of `content' tag must be set to either "true" or "false"}) unless attribute =~ /true|false/i
      (attribute.downcase == 'true') ? true : false
    end
    inherit = boolean_attr['inherit', false]
    summary = boolean_attr['summary', true]
    part_page = page
    if inherit
      while (part_page.part(part_name).nil? and (not part_page.parent.nil?)) do
        part_page = part_page.parent
      end
    end
    contextual = boolean_attr['contextual', true]
    part = part_page.part(part_name)
    tag.locals.page = part_page unless contextual
    if summary
      tag.globals.page.render_snippet(part).split('<div><!--more--></div>')[0] unless part.nil?
    else
      # Find truncate flags (including link if exists)
      more = tag.globals.page.render_snippet(part).match(/<div><!--more--><\/div>/)
      more_with_link = tag.globals.page.render_snippet(part).match(/<div class='read_more'>(.*?)<\/div><div><!--more--><\/div>/)
      
      # Remove truncate flags (including link if exists)
      if !more_with_link.nil?
        tag.globals.page.render_snippet(part).gsub(/<div class='read_more'>(.*?)<\/div><div><!--more--><\/div>/, "")
      elsif !more.nil?
        tag.globals.page.render_snippet(part).gsub(/<div><!--more--><\/div>/, "")
      else
        tag.globals.page.render_snippet(part)
      end
    end
  end
  
  desc "Used to locate the end of a 'summary' and put in a link to the full post."
  tag "more" do |tag|
    global_page = tag.globals.page
    local_page = tag.locals.page
    unless local_page == global_page
      if tag.attr['disable_link'] == nil
        html = "<div class='read_more'><a href='#{local_page.url}'>#{tag.attr['link'] || 'Continue reading'}</a></div>"
        html << "<div><!--more--></div>"
      else
        html = "<div><!--more--></div>"
      end
    else
      html = ""
    end
    html
  end
  
end
