class Whatever
  def make_tag(tag, *options, &block)
    indents = 0
    html_tag = "<#{tag}"

    options.flatten.each{ |opt|
      html_tag += turn_array_options_to_hash_or_string(opt)
    }

    html_tag += ">"

    if block_given?
      indents += 1
      html_tag += "\n#{indent(indents)}"
      html_tag += yield
      indents -= 1
    end

    html_tag += "#{indent(indents)}\n</#{tag}>"
    html_tag
  end

  def self.make_html(&block)
    method_to_call = new
    method_to_call.instance_eval( &block )
  end

  def indent(ind)
    " " * ind
  end

  def turn_array_options_to_hash_or_string(opt)
    return " #{opt}" if opt.is_a?(String || Symbol)
    option = ''
    opt.each{ |opt, val|
      option << set_options(opt, val)
    } if opt.is_a? Hash
    option
  end

  def set_options(opt, val)
    " #{opt}=\"#{val}\""
  end

  def method_missing(method_name, *args, &block)
    send :make_tag, method_name, args, &block
  end
end
