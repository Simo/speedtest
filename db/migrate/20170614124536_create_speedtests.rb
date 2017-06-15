class CreateSpeedtests < ActiveRecord::Migration[5.1]
  def change
    create_table :speed_tests do |t|
      t.float :download
      t.float :upload
      t.integer :originalDownload
      t.integer :originalUpload
      t.string :ip
      t.float :lat
      t.float :lon
      t.string :isp
      t.float :isprating
      t.float :rating
      t.float :ispdlavg
      t.float :ispulavg
      t.string :host
      t.float :hlat
      t.float :hlon
      t.string :location
      t.string :country
      t.string :cc
      t.string :sponsor
      t.float :distance
      t.float :distanceMi
      t.float :ping
      t.string :idh
      t.datetime :time
      t.timestamps null: false
    end
  end
end
