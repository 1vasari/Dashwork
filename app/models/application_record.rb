class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.decorate_with(decorator)
    include MiniDecorator.new(decorator.new)
  end

  def self.routes
    Rails.application.routes.url_helpers
  end
end
