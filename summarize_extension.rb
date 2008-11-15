# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SummarizeExtension < Radiant::Extension
  version "1.0"
  description "Adds summary-like functionality"
  url "http://atinypixel.com"
  
  # define_routes do |map|
  #   map.connect 'admin/summarize/:action', :controller => 'admin/summarize'
  # end
  
  def activate
    Page.send :include, SummarizeTags
    # admin.tabs.add "Summarize", "/admin/summarize", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Summarize"
  end
  
end