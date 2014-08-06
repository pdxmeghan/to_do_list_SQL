require 'pg'
require './lib/task'

DB = PG.connect({:dbname => 'to_do'})
