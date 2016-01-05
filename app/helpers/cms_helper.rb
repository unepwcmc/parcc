module CmsHelper
  include BemHelper

  def cms_section section, current_page
    children = section.children

    concat content_tag(:h3, section.label, class: cms_section_classes(children, current_page))
    content_tag(:div, {class: "#{'u-hide' if !children.include?(current_page)}"}) do
      children.map { |page|
        cms_section_page(current_page, page)
      }.join("\n").html_safe
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

  def cms_section_page current_page, page
    el = 'vertical-nav__element'
    modifiers = ['active'] if current_page == page

    link_to(page.label, "/c#{page.full_path}", class: bem(el, *modifiers))
  end
end
