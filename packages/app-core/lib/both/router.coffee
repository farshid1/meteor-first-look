Router.configure
  layoutTemplate: 'layout'

Router.route '/', ->
  @render 'dashboard'