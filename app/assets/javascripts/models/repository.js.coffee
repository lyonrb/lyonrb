Lyonrb.Repository = SC.Record.extend
  primaryKey: 'id'

Lyonrb.Repository.mixin
  all: (id) -> Lyonrb.store.find(this)
  getContainer: () -> 'repositories'
