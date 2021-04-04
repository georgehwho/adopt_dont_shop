class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.text :description
      t.string :status
      t.references :applicant, foreign_key: true
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
