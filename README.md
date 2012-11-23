Hoarder - Building Passbook Passes with Ruby
============================================
***

## DESCRIPTION

Hoarder is simple DSL for building and creating Apple™ Passbook Passes written in Ruby.

Hoarder allows you to create .pkpass files from within your Ruby applications (Rails or Sinatra) on the fly. It uses a simple DSL to create the JSON data necessary to generate coupons, membership cards, boarding passes, and the other Passbook pass types.

Hoarder currently supports Passkit version 1 (the only version currently from Apple).

## INSTALLATION

```
gem install hoarder
```

## USAGE

```ruby
Hoarder::Passbook.configure do |config|
  config.certificate_path = Rails.root.join('certificate.pem')
  config.certificate_password = ENV['cert_password']
  config.base_path = Rails.root.join('public/pass_assets')
  config.logo = 'logo.png'
  config.logo_2x = 'logo@2x.png'
  config.icon = 'icon.png'
  config.icon_2x = 'icon@2x.png'
  config.pass_type_identifier = 'pass.com.example.membership'
  config.team_identifier = 'A7673L33728'
end
```

```ruby
pass = Hoarder::Passbook::Pass.new
pass.serial_number = '123456'
pass.description = 'Membership Card'
pass.barcode.format = Hoarder::Passbook::BarcodeFormat.QR
pass.barcode.message = '123456'
pk_file = pass.file
```

```ruby
pass = Hoarder::Passbook::Pass.new
...
pass.send('someone@example.com', 'Your membership card is attached')
```

## INTEGRATING INTO A RAILS APP

```ruby
class UsersController < ApplicationController
  def pass
    pass = Hoarder::Passbook::Pass.new
    ...
    render :pkpass => pass
  end
end
```

## TESTING A PASS

## CONTRIBUTING
