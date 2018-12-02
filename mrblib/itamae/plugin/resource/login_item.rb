module ::MItamae
  module Plugin
    module Resource
      class LoginItem < ::MItamae::Resource::Base
        define_attribute :action, default: :create
        define_attribute :name, type: String, default_name: true
        define_attribute :path, type: String
        define_attribute :hidden, default: false

        self.available_actions = [:create, :delete]
      end
    end
  end
end
