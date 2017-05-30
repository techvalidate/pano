# -*- encoding: utf-8 -*-
# stub: pano 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "pano".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jordan McKible".freeze, "Jon Wolfe".freeze]
  s.date = "2017-05-30"
  s.email = ["jordan@techvalidate.com".freeze, "jon@techvalidate.com".freeze]
  s.files = ["README.md".freeze, "Rakefile".freeze, "app/assets/config/pano_manifest.js".freeze, "app/assets/images/pano".freeze, "app/assets/javascripts/pano".freeze, "app/assets/javascripts/pano/app".freeze, "app/assets/javascripts/pano/app/arrow_toggle.coffee".freeze, "app/assets/javascripts/pano/app/calendar.coffee".freeze, "app/assets/javascripts/pano/app/date_picker.coffee".freeze, "app/assets/javascripts/pano/app/dropdown.coffee".freeze, "app/assets/javascripts/pano/app/file_uploads.coffee".freeze, "app/assets/javascripts/pano/app/index.coffee".freeze, "app/assets/javascripts/pano/app/minicolors.coffee".freeze, "app/assets/javascripts/pano/app/modals.coffee".freeze, "app/assets/javascripts/pano/app/scroll_to.coffee".freeze, "app/assets/javascripts/pano/basic".freeze, "app/assets/javascripts/pano/basic/index.coffee".freeze, "app/assets/javascripts/pano/global".freeze, "app/assets/javascripts/pano/global/behavior.coffee".freeze, "app/assets/javascripts/pano/global/browser.coffee".freeze, "app/assets/javascripts/pano/global/clickable.coffee".freeze, "app/assets/javascripts/pano/global/flash_messages.coffee".freeze, "app/assets/javascripts/pano/global/forms.coffee".freeze, "app/assets/javascripts/pano/global/index.coffee".freeze, "app/assets/javascripts/pano/global/inline_spinner.coffee".freeze, "app/assets/javascripts/pano/global/loading_spinner.coffee".freeze, "app/assets/javascripts/pano/global/timezone.coffee".freeze, "app/assets/javascripts/pano/global/ui.coffee".freeze, "app/assets/javascripts/pano/guide".freeze, "app/assets/javascripts/pano/guide/index.coffee".freeze, "app/assets/javascripts/pano/marketing".freeze, "app/assets/javascripts/pano/marketing/index.coffee".freeze, "app/assets/stylesheets/pano".freeze, "app/assets/stylesheets/pano/app".freeze, "app/assets/stylesheets/pano/app/index.sass".freeze, "app/assets/stylesheets/pano/basic".freeze, "app/assets/stylesheets/pano/basic/index.sass".freeze, "app/assets/stylesheets/pano/global".freeze, "app/assets/stylesheets/pano/global/_arrows.sass".freeze, "app/assets/stylesheets/pano/global/_banners.sass".freeze, "app/assets/stylesheets/pano/global/_base.sass".freeze, "app/assets/stylesheets/pano/global/_borders.sass".freeze, "app/assets/stylesheets/pano/global/_boxes.sass".freeze, "app/assets/stylesheets/pano/global/_breakpoints.sass".freeze, "app/assets/stylesheets/pano/global/_browsers.sass".freeze, "app/assets/stylesheets/pano/global/_buttons.sass".freeze, "app/assets/stylesheets/pano/global/_colors.sass".freeze, "app/assets/stylesheets/pano/global/_flash_messages.sass".freeze, "app/assets/stylesheets/pano/global/_forms.sass".freeze, "app/assets/stylesheets/pano/global/_grid.sass".freeze, "app/assets/stylesheets/pano/global/_icons.sass".freeze, "app/assets/stylesheets/pano/global/_images.sass".freeze, "app/assets/stylesheets/pano/global/_links.sass".freeze, "app/assets/stylesheets/pano/global/_lists.sass".freeze, "app/assets/stylesheets/pano/global/_shadows.sass".freeze, "app/assets/stylesheets/pano/global/_spinners.sass".freeze, "app/assets/stylesheets/pano/global/_tables.sass".freeze, "app/assets/stylesheets/pano/global/_tabs.sass".freeze, "app/assets/stylesheets/pano/global/_transforms.sass".freeze, "app/assets/stylesheets/pano/global/_typography.sass".freeze, "app/assets/stylesheets/pano/global/_utilities.sass".freeze, "app/assets/stylesheets/pano/global/index.sass".freeze, "app/assets/stylesheets/pano/guide".freeze, "app/assets/stylesheets/pano/guide/index.sass".freeze, "app/assets/stylesheets/pano/mailers".freeze, "app/assets/stylesheets/pano/mailers/_avatar.sass".freeze, "app/assets/stylesheets/pano/mailers/_buttons.sass".freeze, "app/assets/stylesheets/pano/mailers/_layout.sass".freeze, "app/assets/stylesheets/pano/mailers/_vars.sass".freeze, "app/assets/stylesheets/pano/mailers/index.sass".freeze, "app/assets/stylesheets/pano/marketing".freeze, "app/assets/stylesheets/pano/marketing/index.sass".freeze, "app/controllers/pano".freeze, "app/controllers/pano/application_controller.rb".freeze, "app/controllers/pano/controller_helpers.rb".freeze, "app/controllers/pano/guide_controller.rb".freeze, "app/helpers/pano".freeze, "app/helpers/pano/application_helper.rb".freeze, "app/helpers/pano/box_helper.rb".freeze, "app/helpers/pano/browser_helper.rb".freeze, "app/helpers/pano/button_helper.rb".freeze, "app/helpers/pano/content_helper.rb".freeze, "app/helpers/pano/css_helper.rb".freeze, "app/helpers/pano/dropdown_helper.rb".freeze, "app/helpers/pano/element_helper.rb".freeze, "app/helpers/pano/email_helper.rb".freeze, "app/helpers/pano/example_helper.rb".freeze, "app/helpers/pano/flash_helper.rb".freeze, "app/helpers/pano/form_helper.rb".freeze, "app/helpers/pano/head_helper.rb".freeze, "app/helpers/pano/icon_helper.rb".freeze, "app/helpers/pano/link_helper.rb".freeze, "app/helpers/pano/logo_helper.rb".freeze, "app/helpers/pano/modal_helper.rb".freeze, "app/helpers/pano/number_helper.rb".freeze, "app/helpers/pano/pagination_helper.rb".freeze, "app/helpers/pano/partial_helper.rb".freeze, "app/helpers/pano/resque_helper.rb".freeze, "app/helpers/pano/sjr_helper.rb".freeze, "app/helpers/pano/sorting_helper.rb".freeze, "app/helpers/pano/tags".freeze, "app/jobs/pano".freeze, "app/jobs/pano/application_job.rb".freeze, "app/mailers/pano".freeze, "app/mailers/pano/application_mailer.rb".freeze, "app/models/pano".freeze, "app/models/pano/app_form_builder.rb".freeze, "app/models/pano/application_record.rb".freeze, "app/models/pano/email_validator.rb".freeze, "app/models/pano/link.rb".freeze, "app/models/pano/menu.rb".freeze, "app/models/pano/menu_item.rb".freeze, "app/models/pano/password.rb".freeze, "app/models/pano/redux_element.rb".freeze, "app/views/layouts/pano".freeze, "app/views/layouts/pano/guide.haml".freeze, "app/views/pano".freeze, "app/views/pano/guide".freeze, "app/views/pano/guide/arrows.haml".freeze, "app/views/pano/guide/banners.haml".freeze, "app/views/pano/guide/borders.haml".freeze, "app/views/pano/guide/boxes.haml".freeze, "app/views/pano/guide/breakpoints.haml".freeze, "app/views/pano/guide/browsers.haml".freeze, "app/views/pano/guide/buttons.haml".freeze, "app/views/pano/guide/colors.haml".freeze, "app/views/pano/guide/css.haml".freeze, "app/views/pano/guide/dropdowns.haml".freeze, "app/views/pano/guide/flash_messages.haml".freeze, "app/views/pano/guide/forms.haml".freeze, "app/views/pano/guide/grid.haml".freeze, "app/views/pano/guide/helpers.haml".freeze, "app/views/pano/guide/icons.haml".freeze, "app/views/pano/guide/index.haml".freeze, "app/views/pano/guide/js.haml".freeze, "app/views/pano/guide/links.haml".freeze, "app/views/pano/guide/lists.haml".freeze, "app/views/pano/guide/shadows.haml".freeze, "app/views/pano/guide/spinners.haml".freeze, "app/views/pano/guide/subnavs".freeze, "app/views/pano/guide/subnavs/_css.haml".freeze, "app/views/pano/guide/subnavs/_helpers.haml".freeze, "app/views/pano/guide/subnavs/_js.haml".freeze, "app/views/pano/guide/subnavs/_ui.haml".freeze, "app/views/pano/guide/tables.haml".freeze, "app/views/pano/guide/tabs.haml".freeze, "app/views/pano/guide/tooltips.haml".freeze, "app/views/pano/guide/transforms.haml".freeze, "app/views/pano/guide/typography.haml".freeze, "app/views/pano/guide/utilities.haml".freeze, "config/initializers/hash_extensions.rb".freeze, "config/initializers/infections.rb".freeze, "config/routes.rb".freeze, "lib/pano".freeze, "lib/pano.rb".freeze, "lib/pano/engine.rb".freeze, "lib/pano/version.rb".freeze, "lib/tasks/pano_tasks.rake".freeze]
  s.homepage = "https://github.com/techvalidate/pano".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Shared CSS, Javascript, and helpers for SurveyMonkey Solutions".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bourbon>.freeze, ["= 4.3.4"])
      s.add_runtime_dependency(%q<coffee-rails>.freeze, ["= 4.2.1"])
      s.add_runtime_dependency(%q<haml>.freeze, ["= 4.0.7"])
      s.add_runtime_dependency(%q<jquery-rails>.freeze, ["= 4.1.1"])
      s.add_runtime_dependency(%q<rails>.freeze, ["= 5.0.2"])
      s.add_runtime_dependency(%q<sass-rails>.freeze, ["= 5.0.6"])
      s.add_runtime_dependency(%q<turbolinks>.freeze, ["= 5.0.1"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bourbon>.freeze, ["= 4.3.4"])
      s.add_dependency(%q<coffee-rails>.freeze, ["= 4.2.1"])
      s.add_dependency(%q<haml>.freeze, ["= 4.0.7"])
      s.add_dependency(%q<jquery-rails>.freeze, ["= 4.1.1"])
      s.add_dependency(%q<rails>.freeze, ["= 5.0.2"])
      s.add_dependency(%q<sass-rails>.freeze, ["= 5.0.6"])
      s.add_dependency(%q<turbolinks>.freeze, ["= 5.0.1"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bourbon>.freeze, ["= 4.3.4"])
    s.add_dependency(%q<coffee-rails>.freeze, ["= 4.2.1"])
    s.add_dependency(%q<haml>.freeze, ["= 4.0.7"])
    s.add_dependency(%q<jquery-rails>.freeze, ["= 4.1.1"])
    s.add_dependency(%q<rails>.freeze, ["= 5.1.1"])
    s.add_dependency(%q<sass-rails>.freeze, ["= 5.0.6"])
    s.add_dependency(%q<turbolinks>.freeze, ["= 5.0.1"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
  end
end
