module ::MItamae
  module Plugin
    module ResourceExecutor
      class LoginItem < ::MItamae::ResourceExecutor::Base
        def apply
          if !current.exist && desired.exist
            run_command("osascript -e 'tell application \"System Events\" to make login item at end with properties {name: \"#{attributes[:name]}\",path:\"#{attributes[:path]}\", hidden:#{attributes[:hidden]}}'")
          end

          if current.exist && !desired.exist
            run_command("osascript -e 'tell application \"System Events\" to delete login item \"#{attributes[:name]}\"'")
          end
        end

        private

        def set_current_attributes(current, action)
          result = run_command("osascript -e 'tell application \"System Events\" to get the name of every login item' | awk -F ', ' '{for (i=1; i<=NF; i++) print($i)}' | grep '^#{attributes.name}'", error: false)
          current.exist = (result.exit_status == 0)
        end

        def set_desired_attributes(desired, action)
          case action
          when :create
            desired.exist = true
          when :delete
            desired.exist = false
          end
        end
      end
    end
  end
end
