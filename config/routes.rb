require 'routing-filter'

Rails.application.routes.draw do
  filter :locale
end
