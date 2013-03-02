migration 2, :create_services do
  up do
    create_table :services do
      column :id, Integer, :serial => true
      column :name, String, :length => 255
      column :description, String, :length => 255
      column :url, String, :length => 255
    end
  end

  down do
    drop_table :services
  end
end
