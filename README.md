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

    $ bundle

Or install it yourself as:

    $ gem install form_shui


## Local Script Usage
  $ gem build form_shui.gemspec
  
    This generates a file form_shui-0.0.3.gem
    
  $ sudo gem install form_shui
  
    Installs gem locally for script usage

Sample script
  
```ruby

require 'form_shui'

require 'json'

require 'Time'

FormShui.config.hmac_access_id = put_heroku_config_access_id_here

FormShui.config.hmac_secret = put_heroku_config_hmac_here

FormShui.api_url = "http://forms.cobrajam.com"

```
  
$ irb

`irb` test commands

```ruby

params_list = {"name"=>"email", "events"=>["answer_submit"], "active"=>"true", "config"=>{"address"=>"bcabalo@gmail.com"} }.to_json

FormShui::Hook.list(1)

FormShui::Hook.get("5320d923db08870002000001")

FormShui::Hook.post(1, params_list)

FormShui::Hook.patch("531e6103701fe760b0000002", params_list)

FormShui::Hook.delete("5320dad0db08870002000002")

```
  

## Usage


```ruby
require 'form_shui'
# Setup api_url
FormShui.api_url = "http://promojam.dev:4567"

# create a form
# post /forms
form = FormShui::Form.create({:promotion_id => 3, :organization_id=>1, :structure => {}})

# returns the Form for ID = "502139a9701fe72e11000004"
# get /forms/502139a9701fe72e11000004
form = FormShui:Form.find("502139a9701fe72e11000004")

# update the Form with the attributes specified as hash
# put /forms/502139a9701fe72e11000004
form.update({:promotion_id => "1"})

# destroy the Form
# delete /forms/502139a9701fe72e11000004
form.destroy

# returns a list of answers with organization_id = 1
# get /organizations/1/forms
form.find_by_organization_id(1)

# returns a list of answers with promotion_id = 1
# get /promotions/1/forms
form.find_by_promotion_id(1)

# returns a hash of form field registry attributes
# {"_firstname":"First Name","_lastname":"Last Name","_emailaddress":"Email Address "}
# get /forms/50211c30701fe72827000001/field_registry
form.find_form_columns_by_form_id("50211c30701fe72827000001")

# create a answer with FORM_ID = 50211c30701fe72827000001
# post /forms/50211c30701fe72827000001/answers
FormShui::Answer.create({:prefix => {:form_id => "50211c30701fe72827000001"}, attrs })

# returns a list of answers with FORM_ID = 50211c30701fe72827000001
# get /forms/50211c30701fe72827000001/answers
answer = FormShui::Answer.all(:prefix => {:form_id => "50211c30701fe72827000001"})
 
# returns the Answer for ID = "50213046701fe72e11000002" and FORM_ID = 50211c30701fe72827000001
# get /forms/50211c30701fe72827000001/answers/50213046701fe72e11000002
answer = FormShui::Answer.find("50213046701fe72e11000002", :prefix => {:form_id => "50211c30701fe72827000001"})

# update the Answer with the attributes specified as hash
# put /forms/50213046701fe72e11000002/answers/50211c30701fe72827000001
answer.update({:promotion_id => "1"})

# destroy the Answer
# delete /forms/50213046701fe72e11000002/answers/50211c30701fe72827000001
answer.destroy
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


Runing tests:

    $ bundle exec rake spec
    
Running development console

    $ bundle exec rake console
    
Build and install form_shui-*.gem into system gems 

    $ bundle exec rake install  
