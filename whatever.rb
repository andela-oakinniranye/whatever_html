require './new_html_maker.rb'
gem 'launchy', '~> 2.4.3'
require 'launchy'

# div_tag1 = Whatever.make_html do
#   div class: "col-md-4" do
#     "The Beginning of the Interesting Part"
#   end
# end
#
# div_tag2 = Whatever.make_html do
#   div class: "col-md-4" do
#     "The Uninteresting Part"
#   end
# end
#
# div_tag3 = Whatever.make_html do
#   div class: "col-md-4" do
#     "Bring it on"
#   end
# end
#
# div_tag_big = Whatever.make_html do
#   div class: "col-md-12 text-center" do
#     "Lets get it started"
#   end
# end
#
# head_tag = Whatever.make_html do
#
# end
#
# script_tag = Whatever.make_html do
#   script src: "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"
# end
#
# link_tag = Whatever.make_html do
#   link href: "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
# end
#
# title_tag = Whatever.make_html do
#   title do
#     "The Interesting HTML Maker"
#   end
# end

html_doc = Whatever.make_html do
  html do
    head_tag = head do
      title_tag = Whatever.make_html do
        title do
          "The Interesting HTML Maker"
        end
      end
      script_tag = Whatever.make_html do
        script src: "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js", type: "text/javascript"
      end
      link_tag = Whatever.make_html do
        link href: "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" 
      end
      "#{title_tag}\n#{link_tag}\n#{script_tag}"
    end
    body_tag = body class: :main_body do
      div class: :row do
        div_tag1 = Whatever.make_html do
          div class: "col-md-4" do
            "The Beginning of the Interesting Part"
          end
        end

        div_tag2 = Whatever.make_html do
          div class: "col-md-4" do
            "The Uninteresting Part"
          end
        end

        div_tag3 = Whatever.make_html do
          div class: "col-md-4" do
            "Bring it on"
          end
        end

        div_tag_big = Whatever.make_html do
          div class: "col-md-12 text-center" do
            "Lets get it started"
          end
        end
        "#{div_tag1}\n#{div_tag2}\n#{div_tag3}\n#{div_tag_big}"
      end
    end
    "#{head_tag}\n#{body_tag}"
  end
end

File.open("whatever.html", 'w') do |f|
  f.puts html_doc
end

Launchy.open("http://localhost:9001/whatever.html")
system "http-server -p 9001"
