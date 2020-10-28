class AddAudioToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :audio, :string
  end
end
