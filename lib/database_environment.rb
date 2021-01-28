require 'pg'

def database_environment

  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: "bookmark_manager_test")
  else
    connection = PG.connect(dbname: "bookmark_manager")
  end

end
