module BootstrapHelper
  # To build string either use [tag1, tag2].join("\n").html_safe
  # or
  # body = "".html_safe
  # body.safe_concat content_tag ...
  # body

  def icon_tag(icon, spin: false)
    icon.present? ? content_tag(:i, '', class: ['icon', "icon-#{icon}", spin && "icon-spin"]) : ''.html_safe
  end

  # prepend with the icon
  def label_with_icon_tag(label, icon, spin: false)
    [
        icon_tag(icon, spin: spin),
        label
    ].join("\n").html_safe
  end

  def status_label_tag(status, label: 'default', icon: nil, tooltip: '')
    content_tag(:span, class: ['label', "label-#{label.to_s}"], data: {toggle: 'tooltip'}, title: tooltip.to_s) do
      label_with_icon_tag(status.to_s.titleize, icon)
    end
  end

  def panel_tag(title, &block)
    content_tag :div, class: ['panel', 'panel-default'] do
      [
          content_tag(:div, class: ['panel-heading']) do
            content_tag(:h3, title || '', class: ['panel-title'])
          end,
          block_given? ? content_tag(:div, class: ['panel-body'], &block) : content_tag(:div, '', class: ['panel-body'])
      ].join("\n").html_safe
    end
  end

  def text_field_group_tag (object, field, value, label: nil)
    label ||= field.to_s.titleize
    content_tag(:div, class: ['form-group']) do
      [
          label(object, field, label),
          text_field(object, field, value: value, class: ['form-control'])
      ].join("\n").html_safe
    end
  end

  def submit_or_cancel_group_tag(submit_label)
    content_tag(:div, class: ['form-group']) do
      content_tag(:div, class: ['']) do
        [
            submit_tag(submit_label, class: ['btn', 'btn-primary']),
            link_to("Cancel", :back, class: ['btn'])
        ].join("\n").html_safe
      end
    end
  end

  def search_form_tag(path, query_param, label: '', placeholder: '')
    form_tag path, method: :get, class: 'form-inline', role: 'form' do
      [
          content_tag(:div, class: ['form-group']) do
            [
                label_tag(query_param, label, class: 'sr-only'),
                text_field_tag(query_param, params[query_param], class: ['form-control'], placeholder: placeholder)
            ].join("\n").html_safe
          end,
          content_tag(:div, class: ['form-group']) do
            button_tag(:type => 'submit', :name => nil, :class => ['btn', 'btn-primary']) do
              label_with_icon_tag("Search", 'search')
            end
          end,
      ].join("\n").html_safe
    end
  end

  def process_button_tag(label, post_path, processing: false, processing_label: label)
    if processing
      link_to '#', class: ['btn', 'btn-primary', 'disabled'], disabled: true, data: {no_turbolink: true} do
        label_with_icon_tag(processing_label, 'refresh', spin: true)
      end
    else
      link_to post_path, method: :post, remote: true, class: ['btn', 'btn-primary'] do
        label_with_icon_tag(label, 'refresh', spin: false)
      end
    end
  end

  # Table helpers

  def empty_recordset_tag(message="No records found")
    content_tag(:div, class: 'well') do
      content_tag(:p, message, class: ['lead', 'text-center'])
    end
  end

  # Alerts
  def alert_warning_tag(content=nil, &block)
    content ||= capture(&block) if block_given?
    content_tag(:div, class: ['alert', 'alert-warning']) do
      content_tag(:p, class: ['text-center']) do
        [
            icon_tag('warning-sign'),
            content
        ].join("\n").html_safe
      end
    end
  end
end