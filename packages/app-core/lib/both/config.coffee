Router.configure
  layoutTemplate: 'layout'

Router.onBeforeAction ->

  if !Meteor.userId()
#    Router.go('sign-in')
    @next()
  else
    @next()
  return

AccountsTemplates.removeField 'email'
AccountsTemplates.addField
  _id: 'email'
  type: 'email'
  required: true
  re: /.+@(.+){2,}\.(.+){2,}/
  errStr: 'error.accounts.Invalid email'
  options:
    placeholder: 'Email'
    type: 'email'
    icon: 'glyphicon-envelope'

AccountsTemplates.removeField 'password'
AccountsTemplates.addField
  _id: 'password'
  type: 'password'
  required: true
  minLength: 6
  errStr: 'error.accounts.Invalid email'
  options:
    placeholder: 'Password'
    type: 'password'
    icon: 'glyphicon-lock'


# Options
AccountsTemplates.configure
  enablePasswordChange: true
  showForgotPasswordLink: true
  confirmPassword: false
  overrideLoginErrors: true
  lowercaseUsername: true
  negativeFeedback: false
  positiveFeedback: false
  negativeValidation: true
  positiveValidation: true
  defaultLayout: 'auth_layout'
  texts:
    title:
      signIn: ""
      signUp: ""
    button:
      signIn: "Sign In"
      signUp: "Sign Up"


#Routes
AccountsTemplates.configureRoute 'signIn'
AccountsTemplates.configureRoute 'signUp', path: '/register'
AccountsTemplates.configureRoute 'forgotPwd'
AccountsTemplates.configureRoute 'resetPwd'
AccountsTemplates.configureRoute 'changePwd'
#AccountsTemplates.configureRoute('enrollAccount');
#AccountsTemplates.configureRoute('verifyEmail');

# hack to get signOut route not considered among previous paths
if Meteor.isClient
  Meteor.startup ->
    AccountsTemplates.knownRoutes.push '/sign-out'
    return
