class CalculateDistanceToTarget
  class << self
    def for(lat, lng) # rubocop:disable Metrics/AbcSize
      rad_per_deg = Math::PI / 180
      earth_radius_km = 6371
      rm = earth_radius_km * 1000

      dlat_rad = (lat - target_lat) * rad_per_deg
      dlng_rad = (lng - target_lng) * rad_per_deg

      target_lat_rad = target_lat * rad_per_deg
      lat_rad = lat * rad_per_deg

      a = Math.sin(dlat_rad / 2)**2 + Math.cos(target_lat_rad) * Math.cos(lat_rad) * Math.sin(dlng_rad / 2)**2
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

      rm * c
    end

    def target_lat
      Rails.application.credentials.target_lat
    end

    def target_lng
      Rails.application.credentials.target_lng
    end
  end
end
