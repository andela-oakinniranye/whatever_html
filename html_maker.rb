class Whatever
  def make_tag(tag, options={})
    html_tag = "<#{tag}"
    options.each{|opt, val|
      html_tag += " #{opt}=\"#{val}\""
    }
    html_tag += ">"
    html_tag += yield if block_given?
    html_tag += "</#{tag}>"

    html_tag

  end

  def method_missing(method_name, *args)
    send :make_tag, method_name, args
  end
end
