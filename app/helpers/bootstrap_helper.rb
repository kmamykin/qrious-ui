module BootstrapHelper
  # To build string either use [tag1, tag2].join("\n").html_safe
  # or
  # body = "".html_safe
  # body.safe_concat content_tag ...
  # body

  def icon_tag(icon, spin: false)
    icon.present? ? content_tag(:i, '', class: ['icon', "icon-#{icon}", spin && "icon-spin"]) : ''.html_safe
  end

  def status_label_tag(status, label: 'default', icon: nil, tooltip: '')
    content_tag(:span, class: ['label', "label-#{label.to_s}"], data: {toggle: 'tooltip'}, title: tooltip.to_s) do
      [
          icon_tag(icon),
          status.to_s.titleize
      ].compact.join("\n").html_safe
    end
  end

  def panel_tag(title: '', &block)
    content_tag :div, class: ['panel', 'panel-default'] do
      [
          content_tag(:div, class: ['panel-heading']) do
            content_tag(:h3, title, class: ['panel-title'])
          end,
          content_tag(:div, class: ['panel-body'], &block)
      ].join("\n").html_safe
    end
  end
end