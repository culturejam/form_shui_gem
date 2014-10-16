SocialStorm Form-Shui Gem
==========================

Client gem for [Form-Shui](https://github.com/culturejam/form_shui) service.


Projects in the SocialStorm Family
====================================

| Name                 | URL                                                | Description                   |
| -------------------- | -------------------------------------------------- | ----------------------------- |
| SocialStorm Vagrant  | https://github.com/culturejam/socialstorm-vagrant  | Vagrant project for configuring a local development environment. |
| Management           | https://github.com/culturejam/management           | The PromoJam admin interface. |
| Analytics            | https://github.com/culturejam/analytics            | Handles asynchronous analytics requests and provides API to retrieve analytics data. |
| FormShui             | https://github.com/culturejam/form_shui            | Handles form builder requests and provides API to CRUD forms data. |
| FormShui Gem         | https://github.com/culturejam/form_shui_gem        | Client gem for form_shui form builder. |


Getting Started
=================

## Installation

See installation instructions in the [socialstorm-vagrant README](https://github.com/culturejam/socialstorm-vagrant)

## Other Important Info

* [Developer Guidelines & Info](https://github.com/culturejam/management/wiki/Info)
    * [Git Guidelines](https://github.com/culturejam/management/wiki/Git-Guidelines)
    * [Ruby Guidelines](https://github.com/culturejam/management/wiki/Ruby-Guidlines)
    * [JS Guidelines](https://github.com/culturejam/management/wiki/JS-Guidelines)
    * [CSS Guidelines](https://github.com/culturejam/management/wiki/CSS-Guidelines)

---

* [Frequenty Asked Questions](https://github.com/culturejam/management/wiki/Developer-FAQ)


Form-Shui Details
===================

## Requirements

* Ruby ~> 1.9.2


## Installation

Add this line to your application's Gemfile:

    gem 'form_shui'

And then execute:

    $> bundle

Or install it yourself as:

    $> gem install form_shui


## Usage

Configure the FormShui client:

```ruby
require 'form_shui'

# Configure connection
FormShui.config.hmac_access_id = <access_id>
FormShui.config.hmac_secret = <secret>
FormShui.api_url = "http://localhost:4000"
```

Forms:

```ruby
# Create a form
form = FormShui::Form.create({
  :promotion_id => 1,
  :organization_id=>1,
  :structure => {"form_options"=>"{\"name\":\"Demo Form\",\"columns\":1,\"size\":\"medium\",\"id\":\"form\",\"ref\":\"form\"}", "name"=>"New Form", "rows"=>[{"type"=>"widgets", "columns"=>[{"data"=>["{\"label\":\"Full Name \",\"value\":\"\",\"hint\":\"First name, Last name\",\"font\":\"default\",\"size\":\"medium\",\"bold\":false,\"italic\":false,\"underline\":false,\"required\":false,\"filter\":\"any\",\"labelColor\":\"default\",\"valueColor\":\"default\",\"hintColor\":\"default\",\"id\":\"name\",\"ref\":\"name_\",\"name\":\"full_name_\"}", "{\"label\":\"Email Address \",\"value\":\"\",\"hint\":\"\",\"font\":\"default\",\"size\":\"medium\",\"bold\":false,\"italic\":false,\"underline\":false,\"required\":false,\"filter\":\"email\",\"labelColor\":\"default\",\"valueColor\":\"default\",\"hintColor\":\"default\",\"id\":\"email\",\"ref\":\"email_\",\"name\":\"email_address_\"}", "{\"label\":\"\",\"value\":\"Submit\",\"hint\":\"\",\"font\":\"default\",\"size\":\"medium\",\"bold\":false,\"italic\":false,\"underline\":false,\"required\":false,\"filter\":\"button\",\"labelColor\":\"default\",\"valueColor\":\"default\",\"hintColor\":\"default\",\"id\":\"button\",\"ref\":\"button1\",\"name\":\"\"}"]}]}]}
})

# Get a form
form = FormShui::Form.find(form.id)

# Update a form
# Updates MUST include all current and updated params!
form.update({
  :promotion_id => 3,
  :organization_id=>1,
  :structure => {"form_options"=>"{\"name\":\"Renamed Demo Form\",\"columns\":1,\"size\":\"medium\",\"id\":\"form\",\"ref\":\"form\"}", "name"=>"New Form", "rows"=>[{"type"=>"widgets", "columns"=>[{"data"=>["{\"label\":\"Full Name \",\"value\":\"\",\"hint\":\"First name, Last name\",\"font\":\"default\",\"size\":\"medium\",\"bold\":false,\"italic\":false,\"underline\":false,\"required\":false,\"filter\":\"any\",\"labelColor\":\"default\",\"valueColor\":\"default\",\"hintColor\":\"default\",\"id\":\"name\",\"ref\":\"name_\",\"name\":\"full_name_\"}", "{\"label\":\"Email Address \",\"value\":\"\",\"hint\":\"\",\"font\":\"default\",\"size\":\"medium\",\"bold\":false,\"italic\":false,\"underline\":false,\"required\":false,\"filter\":\"email\",\"labelColor\":\"default\",\"valueColor\":\"default\",\"hintColor\":\"default\",\"id\":\"email\",\"ref\":\"email_\",\"name\":\"email_address_\"}", "{\"label\":\"\",\"value\":\"Submit\",\"hint\":\"\",\"font\":\"default\",\"size\":\"medium\",\"bold\":false,\"italic\":false,\"underline\":false,\"required\":false,\"filter\":\"button\",\"labelColor\":\"default\",\"valueColor\":\"default\",\"hintColor\":\"default\",\"id\":\"button\",\"ref\":\"button1\",\"name\":\"\"}"]}]}]}
})
```

Answers:

```ruby
# Get answers
answers = FormShui::Answer.all(:prefix => {:form_id => "50211c30701fe72827000001"})

# Create an answer
answer = FormShui::Answer.create({
  :prefix => {:form_id => "form_id"},
  attrs
})
```

Hooks (untested examples):

```ruby
# Hook Examples
hook_params = {
  "name"=>"email",
  "events"=>["answer_submit"],
  "active"=>"true",
  "config"=>{"address"=>"user@example.com"}
}.to_json

FormShui::Hook.list(form.id)
FormShui::Hook.post(form.id, hook_params)
FormShui::Hook.get("5320d923db08870002000001")
FormShui::Hook.patch("531e6103701fe760b0000002", hook_params)
FormShui::Hook.delete("5320dad0db08870002000002")
```

## Local Development

Build and install the gem locally:

```sh
$> gem build form_shui.gemspec # Generate gem file
$> gem install form_shui       # Install gem locally
```

Running development console:

```sh
$> bundle exec rake console
```

Build and install form_shui-*.gem into system gems:

```sh
$> bundle exec rake install
```

## Running Tests

```sh
$> bundle exec rake spec
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
