Solidus Segment
==============

Provides support for [Segment](https://segment.com/docs/spec/) APIs: 
* Indentify (Ruby)
* Track ecommerce events 
    *  Cart Viewed (Js)
    *  Checkout Started (Js)
    *  Checkout Step Viewed (Js)
    *  CompleteRegistration FB (Ruby)
    *  Order Completed (Ruby)
    *  Product Added (Ruby)
    *  Product Clicked (Ruby)    
    *  Payment Info Entered (Js)
    *  Product List Filtered (Js)
    *  Product List Viewed (Js)
    *  Product Removed (Js)
    *  Product Viewed (Js)
    *  Products Searched (Js)
    *  Sign In User (Ruby)
* Page with the segment [analytics.js](https://segment.com/docs/sources/website/analytics.js/quickstart/) 

We combine [Javascript Source](https://segment.com/docs/sources/website/analytics.js/) and [Ruby Source](https://segment.com/docs/sources/server/ruby/) for the server-side library

Some of the ideas behind are inspired by 
* https://github.com/spree-contrib/spree_analytics_trackers
* https://www.cookieshq.co.uk/posts/how-we-use-segment-with-solidus-spree
* https://robots.thoughtbot.com/segment-io-and-ruby


Installation
------------

Add solidus_segment to your Gemfile:

```ruby
gem 'solidus_segment', github: '2beDigital/solidus_segment'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g solidus_segment:install
```

Add to the **config/initializers/analytics_ruby.rb** SEGMENT_KEY_RUBY
  ```ruby
Analytics = Segment::Analytics.new({
                                       write_key: ENV['SEGMENT_KEY_RUBY'],
                                       on_error: Proc.new { |status, msg| print msg }
                                   })
  ```
  
  Add to yout application.rb/application.yml SEGMENT_KEY_JS
  ```javascript
  <script type="text/javascript">
    !function(){var analytics=window.analytics=window.analytics||[];if(!analytics.initialize)if(analytics.invoked)window.console&&console.error&&console.error("Segment snippet included twice.");else{analytics.invoked=!0;analytics.methods=["trackSubmit","trackClick","trackLink","trackForm","pageview","identify","reset","group","track","ready","alias","debug","page","once","off","on"];analytics.factory=function(t){return function(){var e=Array.prototype.slice.call(arguments);e.unshift(t);analytics.push(e);return analytics}};for(var t=0;t<analytics.methods.length;t++){var e=analytics.methods[t];analytics[e]=analytics.factory(e)}analytics.load=function(t,e){var n=document.createElement("script");n.type="text/javascript";n.async=!0;n.src="https://cdn.segment.com/analytics.js/v1/"+t+"/analytics.min.js";var a=document.getElementsByTagName("script")[0];a.parentNode.insertBefore(n,a);analytics._loadOptions=e};analytics.SNIPPET_VERSION="4.1.0";
      analytics.load("<%=ENV['SEGMENT_KEY_JS']%>".replace(/^\s+|\s+$/g, ''));
      analytics.page();
    }}();
  </script>
  ```

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs, and [Rubocop](https://github.com/bbatsov/rubocop) static code analysis. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'solidus_segment/factories'
```

TODO
-------
Some additional events and features could include:
* Promotions 
* Order updated , order cancelled, order refunded
* Coupons, sharing, Wishlisting , reviewing
* Avoid class_eval improve the code
* Test coverage


Copyright (c) 2019 [2beDigital](http://www.2bedigital.com/?utm_source=github), released under the New BSD License



