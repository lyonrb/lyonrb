@Lyonrb.User = SC.Record.extend
  primaryKey: 'id'
  github_url: ( -> 'https://github.com/'+this.get('login')).property().cacheable()
  avatar: ( -> 'http://www.gravatar.com/avatar/'+this.get('gravatar_id')+'?s=200').property().cacheable()

@Lyonrb.User.mixin
  all: (id) -> Lyonrb.store.find(this)
  getContainer: () -> 'users'
