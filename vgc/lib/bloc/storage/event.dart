abstract class StorageEvent {
  const StorageEvent();
}

class WriteEvent extends StorageEvent {
  String url;
  WriteEvent(this.url);
}

class ReadEvent extends StorageEvent {
  const ReadEvent();
}
