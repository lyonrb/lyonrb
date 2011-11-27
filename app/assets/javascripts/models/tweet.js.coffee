Lyonrb.Tweet = SC.Record.extend
  primaryKey: 'id'
  permalink: ( -> "http://twitter.com/lyonrb/status/#{this.get('id')}").property().cacheable()

Lyonrb.Tweet.mixin
  all: (id) -> Lyonrb.store.find(this)
  getContainer: () -> 'tweets'
