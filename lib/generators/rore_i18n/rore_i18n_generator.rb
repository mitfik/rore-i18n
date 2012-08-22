class RoreI18nGenerator < Rails::Generators::Base

  def create_initiazlier_file
    puts "Generate initializer in config/initializers/rore-i18n.rb"
    languages = ask("Write what languages you want to use e.g: en pl es, [en]")
    languages ||= ["en"]
    languages = languages.split(" ").to_s
    initializer("rore-i18n.rb") do 
      "GlobalConstants::LANGUAGES = #{languages}"
    end
    puts "Copy migrations"
    rake("rore_i18n_engine:install:migrations")
    puts "Run migration for rore-i18n"
    rake("db:migrate SCOPE=rore_i18n")
  end
end
