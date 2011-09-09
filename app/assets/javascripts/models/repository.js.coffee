Lyonrb.Repository = SC.Record.extend
  primaryKey: 'name'

Lyonrb.Repository.mixin
  all: (id) -> Lyonrb.store.find(this)
  getContainer: () -> 'repositories'
