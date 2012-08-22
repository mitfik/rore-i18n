rore_i18n
=========

i18n with globalize for ror-ecommerce 


Add by manual or use rake task for that
config/initializers/rore-i18n.rb

GlobaleConstants::LANGUAGES = ["en", "pl"]


## Add lang bar to the view

for example to app/views/shared/_main_product_tabs.er

    7 <ul id='main-myaccount-tabs'>
    8     <%= render :partial => "rore-i18n/language_bar" %>
    9     <li class='shopping_tab'>       <%= link_to_unless_current 'My Account', myaccount_overview_path if most_likely_user %> </li>
    10 </ul>

## Fallbacks:
    
    config.i18n.fallbacks = [:en, :pl]
