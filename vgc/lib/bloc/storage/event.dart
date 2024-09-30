abstract class StorageEvent {
  const StorageEvent();
}

class WriteEvent extends StorageEvent {
  final String url;
  const WriteEvent(this.url);
}

class ReadEvent extends StorageEvent {
  const ReadEvent();
}
