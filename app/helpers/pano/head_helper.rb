module Pano
  module HeadHelper

    # todo: would be nice not to have to do this... research how.
    def disable_turbolinks_cache
      s "<meta name='turbolinks-cache-control' content='no-cache'>"
    end

    def disable_turbolinks_preview
      s "<meta name='turbolinks-cache-control' content='no-preview'>"
    end

    def ie_meta_tags
      s <<-EOF
      <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
      <meta content='text/html; charset=utf-8' http-equiv='Content-Type'>
      <meta http-equiv="imagetoolbar" content="no" />
      EOF
    end

    def uncrawlable_meta_tags
      s <<-EOF
      <meta name="robots" content="noindex, follow">
      <meta name="googlebot" content="noindex, follow">
      <meta name="robots" content="noimageindex">
      <meta name="robots" content="noarchive">
      EOF
    end

    def mobile_meta_tag
      s "<meta name='viewport' content='width=device-width, initial-scale=1'>"
    end

    def favicons
      s <<-EOF
      <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
      <link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
      <link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
      <link rel="manifest" href="/manifest.json">
      <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#00A8FF">
      <meta name="theme-color" content="#ffffff">
      EOF
    end

  end

end
