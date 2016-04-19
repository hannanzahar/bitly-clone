#adding column inside existing database

class AddCounter < ActiveRecord::Migration
	def change
		add_column :urls, :counter, :integer
		#name of database to be added, name of column, type e.g string, text
	end
end