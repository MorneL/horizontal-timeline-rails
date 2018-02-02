module Horizontal
  module Timeline
    module Rails
      require 'horizontal-timeline-rails/engine'
      require 'horizontal-timeline-rails/version'

      def timeline_container(*items)
        """
        <section class=\"cd-horizontal-timeline\">
          <div class=\"timeline\">
            <div class=\"events-wrapper\">
              <div class=\"events\">
                <ol>
                  #{timeline_item(items)}
                </ol>
                <span class=\"filling-line\" aria-hidden=\"true\"></span>
              </div> <!-- .events -->
            </div> <!-- .events-wrapper -->
              
            <ul class=\"cd-timeline-navigation\">
              <li><a href=\"#0\" class=\"prev inactive\">Prev</a></li>
              <li><a href=\"#0\" class=\"next\">Next</a></li>
            </ul> <!-- .cd-timeline-navigation -->
          </div> <!-- .timeline -->
        
          <div class=\"events-content\">
            <ol>
              #{timeline_content(items)}
            </ol>
          </div> <!-- .events-content -->
        </section>
      """.html_safe
      end

      def timeline_item(items)
        timeline_items = []
        items.each_with_index do |item, index|
          timeline_items << "<li><a href=\"#0\" data-date=\"#{item[:date].strftime("%d/%m/%Y")}\" #{"class=\"selected\"" if index == 0}>#{item[:date].strftime("%Y")}</a></li>"
        end

        timeline_items.join("")
      end

      def timeline_content(items)
        timeline_contents = []
        items.each_with_index do |item, index|
          timeline_contents <<  "<li #{"class=\"selected\"" if index == 0} data-date=\"#{item[:date].strftime("%d/%m/%Y")}\">
                                  <h2>#{item[:title]}</h2>
                                  <p>#{item[:description]}</p>
                                </li>"
        end

        timeline_contents.join("")
      end
    end
  end
end

ActionView::Base.send :include, Horizontal::Timeline::Rails
