rore_i18n
=========

i18n with globalize for ror-ecommerce 


## How to install

Add  to your Gemfile:

    gem "rore-i18n", :git => "git://github.com/mitfik/rore-i18n.git"

Run:

    rails g rore_i18n

Answer for question what languages you want to use. Remember that you need to have locales files for each language to make it work (e.g. config/locales/pl.yml)

## Supported languages:
* en
* pl

If you are interested to add support for another langauges, just take one of existing one and translate it. After that make pull request with it.

## Add lang bar to the view

for example to app/views/shared/_main_product_tabs.er

    7 <ul id='main-myaccount-tabs'>
    8     <%= render :partial => "rore-i18n/language_bar" %>
    9     <li class='shopping_tab'>       <%= link_to_unless_current 'My Account', myaccount_overview_path if most_likely_user %> </li>
    10 </ul>

## Fallbacks:

    config.i18n.fallbacks = [:en, :pl]
