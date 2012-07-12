        //= require jquery
        //= require jquery_ujs
        //= require twitter/bootstrap
        //= require_tree .
      RUBY 
      # >---- change assets link ---- <
      gsub_file 'app/views/layouts/admin.html.erb', /stylesheet_link_tag    "application"/, "stylesheet_link_tag    'admin/application'"
            gsub_file 'app/views/layouts/admin.html.erb', /javascript_include_tag "application"/, "javascript_include_tag 'admin/application'"       
      insert_into_file 'app/assets/'
      #----------------------
    when 'bootstrap_sass'
      say_wizard 'installing Twitter Bootstrap HTML5 framework (sass)'
      insert_into_file 'app/assets/javascripts/application.js', "//= require bootstrap
", :after => "jquery_ujs
"
      create_file 'app/assets/stylesheets/bootstrap_and_overrides.css.scss', <<-RUBY
// Set the correct sprite paths
$iconSpritePath: asset-url('glyphicons-halflings.png', image);
$iconWhiteSpritePath: asset-url('glyphicons-halflings-white.png', image);
@import "bootstrap";
body { padding-top: 60px; }
@import "bootstrap-responsive";
