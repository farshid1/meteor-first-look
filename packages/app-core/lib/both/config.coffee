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
