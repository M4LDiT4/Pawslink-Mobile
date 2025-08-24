enum SyncStatus {
  synced, //from the cloud or updated data
  notSynced, //saved to localdatabase
  conflict, // if modified by both cloud and local
}