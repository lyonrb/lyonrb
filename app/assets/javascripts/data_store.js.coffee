# mostly stolen from http://svarovsky-tomas.com/sproutcore-datasource.html, thanks Tomáš!

Lyonrb.DataSource = SC.DataSource.extend
  fetch: (store, query) ->
    options =
      url:     this._urlForQuery(query)
      store:   store
      query:   query
      isQuery: YES

    this._getFromUrl(options) if options.url
    return NO

  retrieveRecord: (store, storeKey) ->
    url = this._urlForRecord(storeKey, store.idFor(storeKey))
    this._getFromUrl
      url:      url
      storeKey: storeKey
      store:    store
      type:     store.recordTypeFor(storeKey)
    return YES

  _urlForQuery: (query) ->
    if(query.url)
      return query.url
    else if(query.recordType == Lyonrb.Repository)
      return '/api_proxy/repositories.json'
    else if(query.recordType == Lyonrb.User)
      return '/api_proxy/members.json'
    else if(query.recordType == Lyonrb.Tweet)
      return '/api_proxy/tweets.json'
    console.log('cannot generate url for query:', query)

  _urlForRecord: (storeKey, id) ->
    recordType = SC.Store.recordTypeFor(storeKey)
    if (recordType == Lyonrb.Repository)
      return '/repositories/%@.json'.fmt(id)
    else if (recordType == Lyonrb.User)
      return '/users/%@.json'.fmt(id)
    else if (recordType == Lyonrb.Tweet)
      return '/tweets/%@.json'.fmt(id)
    else
      console.log('cannot generate url for ' + recordType)

  _getFromUrl: (options) ->
    notifyMethod = if options.isQuery then this._didGetQuery else this._didRetrieveRecords
    SC.Request.getUrl(options.url).set('isJSON', YES).notify(this, notifyMethod, options).send()
    return YES

  _didGetQuery: (response, params) ->
    store     = params.store
    query     = params.query
    recordType      = params.query.get('recordType')

    if (SC.ok(response))
      if (query.get('isLocal'))
        ret = SC.json.decode(response.get('encodedBody'))

        hash = if (recordType == Lyonrb.Repository)
          ret[recordType.getContainer()]
        else if (recordType == Lyonrb.User)
          ret[recordType.getContainer()]
        else if (recordType == Lyonrb.Tweet)
          ret
        else
          console.log('cannot find the appropriate type')
        console.log(hash)
        store.loadRecords(recordType, hash)
        store.dataSourceDidFetchQuery(query)
      else
        storeKeys = store.loadRecords(recordType, response.get('body'))
        store.loadQueryResults(query, storeKeys)
    else
      store.dataSourceDidErrorQuery(query, response)

  _didRetrieveRecords: (response, params) ->
    store = params.store
    type  = params.type
    if (SC.ok(response))
      data = response.get('body')
      store.loadRecords(type, if data.isEnumerable then data else [data])
    else
      store.dataSourceDidError(storeKey, response.get('body'))
