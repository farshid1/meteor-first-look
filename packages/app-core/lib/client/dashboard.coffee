Template.dashboard.events
  'click #logoff': (evt, tmpl) ->
    console.log 'logging out'
    AccountsTemplates.logout