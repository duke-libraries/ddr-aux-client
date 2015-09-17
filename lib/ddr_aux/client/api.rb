module DdrAux::Client
  module Api

    MODELS = {
      license: "License",
      admin_set: "AdminSet",
    }.freeze

    MODELS.each do |key, class_name|
      # get_license(id) => License.get(id)
      define_method "get_#{key}" do |id|
        klass = const_get(class_name, false)
        klass.get(id)
      end

      # get_licenses => License.list
      # licenses => License.list
      define_method "get_#{key}s" do
        klass = const_get(class_name, false)
        klass.list
      end
      alias_method "#{key}s", "get_#{key}s"

      # find_license(**args) => License.find(**args)
      define_method "find_#{key}" do |args|
        klass = const_get(class_name, false)
        klass.find **args
      end

      # license(arg)
      # => find_license(**(arg.to_h))
      # => get_license(arg)
      define_method key do |arg|
        if arg.respond_to?(:to_h)
          send "find_#{key}", **(arg.to_h)
        else
          send "get_#{key}", arg
        end
      end
    end

  end
end
