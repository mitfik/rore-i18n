class RoreI18nGenerator < Rails::Generators::Base

  def setup_plugin
    puts "Copy migrations"
    rake("rore_i18n_engine:install:migrations")
    puts "Run migration for rore-i18n"
    rake("db:migrate SCOPE=rore_i18n")
  end
end
