class StorageManager

  private

  def get_all_storages
    [
      Storages::ActiveRecord::Repositories::User,
    ]
  end

end