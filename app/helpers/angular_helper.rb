module AngularHelper
  def embed_templates
    # TODO: use the same gem to traverse/list files as Sprockets/Rails uses
    templates_path = Pathname(Rails.root.join(*%w(app assets templates)))
    Pathname.glob(templates_path + '**/*').reject(&:directory?).map do |pathname|
      Rails.application.assets[pathname.relative_path_from(templates_path)]
    end.map do |asset|
      content_tag :script,
          asset.to_s.html_safe,
          type: 'text/ng-template',
          id: asset.logical_path.split('.')[0..1].join('.') # Remove extra extensions if exist
    end.join("\n").html_safe
  end
end