module Pano
  module PartialHelper

    # ------------------------------------------------------------
    #                      P A R T I A L
    # ------------------------------------------------------------
    #
    # This is a convenience method that makes it less typing to render
    # partials, especially when you need to pass locals.
    #
    # note: does not support some render() options like file or
    # layout. also assumes you're using haml unless you specify options[:format]
    #
    # how to use:
    #
    #    render just a partial:
    #
    #      partial 'foo'
    #
    #    render a partial with locals:
    #
    #      partial 'foo', x: x, y: y
    #
    #    render a collection:
    #
    #      partial 'foo', collection: c
    #
    #    render an ojbect:
    #
    #      partial 'foo', object: o
    #
    #    render a collection with locals:
    #
    #      partial 'foo', collection: c, x: x, y: y
    #
    # ------------------------------------------------------------

    def partial(name, options = {})
      collection        = options.delete :collection
      object            = options.delete :object
      is_template       = options.delete :is_template
      formats           = options.delete :formats
      locals            = options
      opts              = {}
      opts[:collection] = collection if collection
      opts[:object]     = object if object
      opts[:formats]    = formats
      opts[:locals]     = locals

      if is_template
        opts[:template] = name
      else
        opts[:partial] = name
      end

      render opts
    end

    # use this when you want to render a template as if it's a partial
    def template(name, options = {})
      options[:is_template] = true
      partial name, options
    end

  end

end
