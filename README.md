# Mitamae::Plugin::Resource::LoginItem

[Mitamae](https://github.com/itamae-kitchen/mitamae/) resource plugin to manage login items in macOS.

## Install

``` shell
mkdir -p ./plugins
git submodule add https://github.com/hirocaster/mitamae-plugin-resource-login_item plugins/mitamae-plugin-resource-login_item
# or `git clone`
```

## Usage

Will be auto startup `Slack.app` at login.

```ruby
login_item "Slack" do
  path "/Applications/Slack.app"
  hidden false
  user node[:user]
  action :create # or :delete
end
```
