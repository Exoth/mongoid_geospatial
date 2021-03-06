module Mongoid
  module Geospatial
    class Point

      def mongoize(object)
        return unless object && !object.empty?
        RGeo::Geographic.spherical_factory.point *object
        #["x"], object["y"]
      end

      def demongoize(object)
        object.respond_to?(:x) ? [object.x, object.y] : object
        # if object.respond_to? :x
        #   { "x" => object.x, "y" => object.y }
        # else
        #   { "x" => object[0], "y" => object[1] }
        # end
      end

#       -    self.spacial_fields ||= []
# -    self.spacial_fields << field.name.to_sym if self.spacial_fields.kind_of? Array
# -
# -    define_method "distance_from_#{field.name}" do |*args|
# -      self.distance_from(field.name, *args)
# -    end
# -
# -    define_method field.name do
# -      output = self[field.name] || [nil,nil]
# -      output = {lng_meth => output[0], lat_meth => output[1]} unless options[:return_array]
# -      return options[:class].new(output) if options[:class]
# -      output
# -    end
# -
# -    define_method "#{field.name}=" do |arg|
# -      if arg.kind_of?(Hash) && arg[lng_meth] && arg[lat_meth]
# -        arg = [arg[lng_meth].to_f, arg[lat_meth].to_f]
# -      elsif arg.respond_to?(:to_xy)
# -        arg = arg.to_xy
# -      end
# -      self[field.name]=arg
# -      arg = [nil,nil] if arg.nil?
# -      return arg[0..1] if options[:return_array]
# -      h = {lng_meth => arg[0], lat_meth => arg[1]}
# -      return h if options[:class].blank?
# -      options[:class].new(h)

    end
  end
end
