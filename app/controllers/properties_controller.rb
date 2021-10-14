class PropertiesController < ApplicationController
  def index
    @madison_properties = Property.where(city: 'Madison')
  end
end
