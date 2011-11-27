Lyonrb.controllers = SC.Object.create
  repositories: SC.ArrayController.create
    init: () -> this.set('content', Lyonrb.Repository.all())
  users: SC.ArrayController.create
    init: () -> this.set('content', Lyonrb.User.all())
  tweets: SC.ArrayController.create
    init: () -> this.set('content', Lyonrb.Tweet.all())
