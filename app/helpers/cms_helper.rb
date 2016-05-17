module CmsHelper
  include BemHelper

  def report_url(cms_site)
    if @cms_site.path == "fr"
      "http://wcmc.io/parcc-report-fr"
    else
      "http://wcmc.io/parcc-report-en"
    end
  end

  def cms_section section, current_page
    children = section.children

    if children.any?
      concat content_tag(:h3, section.label, class: cms_section_classes(children, current_page))
      content_tag(:div, {class: "#{'u-hide' if !children.include?(current_page)}"}) do
        children.map { |page|
          cms_section_page(current_page, page)
        }.join("\n").html_safe
      end
    else
      cms_section_page(current_page, section, false)
    end
  end

  def cms_section_classes children, current_page
    modifiers = ['expandable'].tap { |mods|
      if children.include?(current_page)
        mods << 'selected' << 'opened'
      else
        mods << 'closed'
      end
    }

    "#{bem('vertical-nav__element', *modifiers)} js-toggle-section"
  end

  def cms_section_page current_page, page, child=true
    el = 'vertical-nav__element'
    modifiers = [].tap { |m|
      m << 'active' if current_page == page
      m << 'child'  if child
    }

    link_to(page.label, File.join('/', page.site.path, page.full_path), class: bem(el, *modifiers))
  end
end
