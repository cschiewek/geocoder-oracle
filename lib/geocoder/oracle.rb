require 'geocoder/oracle/version'
require 'geocoder/sql'

module Geocoder
  module Oracle
    
  end

  module Sql
    extend self

    ##
    # Fairly accurate bearing calculation. Takes a latitude, longitude,
    # and an options hash which must include a :bearing value
    # (:linear or :spherical).
    #
    # Based on:
    # http://www.beginningspatial.com/calculating_bearing_one_point_another
    #
    # Overridden for Oracle as Oracle has no support for modulo % operator.
    ##
    def full_bearing(latitude, longitude, lat_attr, lon_attr, options = {})
      case options[:bearing] || Geocoder.config.distances
      when :linear
        "MOD(" +
        "CAST(" +
          "DEGREES(ATAN2( " +
            "RADIANS(#{lon_attr} - #{longitude.to_f}), " +
            "RADIANS(#{lat_attr} - #{latitude.to_f})" +
          ")) + 360 " +
        "AS decimal), 360)"
      when :spherical
        "MOD(" +
        "CAST(" +
          "DEGREES(ATAN2( " +
            "SIN(RADIANS(#{lon_attr} - #{longitude.to_f})) * " +
            "COS(RADIANS(#{lat_attr})), (" +
              "COS(RADIANS(#{latitude.to_f})) * SIN(RADIANS(#{lat_attr}))" +
            ") - (" +
              "SIN(RADIANS(#{latitude.to_f})) * COS(RADIANS(#{lat_attr})) * " +
              "COS(RADIANS(#{lon_attr} - #{longitude.to_f}))" +
            ")" +
          ")) + 360 " +
        "AS decimal), 360)"
      end
    end
  end
end