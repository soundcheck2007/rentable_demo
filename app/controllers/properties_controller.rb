class PropertiesController < ApplicationController
  def index
    @madison_properties = Property.where(city: 'Madison')

    output_json(@madison_properties)
  end

  private

  def output_json(madison_properties)
    formatted_madison_properties = madison_properties.map { |property| { property_id: property.rentableId, name: property.name, email: property.email }}
    puts "\n\n\n" + formatted_madison_properties.inspect + "\n\n\n"
  end 
end
