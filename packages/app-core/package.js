// App: Core (3rd layer)
//
// * This is where your modules are built into an application. The only package
// you should have to `meteor add` is  `metepor add app:core`. This package
// also acts as an umbrella by including alll your app's dependencies/code, and
// alko acts as a namespace manager.
//
// *  In each module, you should have exported a single global variable with
//    anything that we might neeed to access. Here in app:core, move these
//    exports into the 'App' global namespace.

Package.describe({
  name: 'app:core',
  summary: 'Core application package.',
  version: '1.0.0',
  git: 'https://github.com/username/app-core',
  documentation: null
});

Package.onUse(function(api) {

  var both = ['client', 'server'];
  api.versionsFrom("METEOR@1.0");

  // Here you add all your modules, and also define the load order by the way
  // you order them in this array. MAKE SURE app:lib always goes first!
  var packages = [
    'app:lib', // no dependencies
    'app:users', // lib
  ];

  api.use(packages); // all code => this package

  api.imply(packages); // this package => application


  // both
  api.addFiles([
    'lib/both/router.coffee',
    'lib/both/config.coffee'
  ], both);

  // client
  api.addFiles([
    'lib/client/layout.jade',
    'lib/client/layout.coffee',
    'lib/client/dashboard.jade',
    'lib/client/dashboard.coffee',
    'lib/client/templates/navbar.jade',
    'lib/client/templates/sidebar/sidebar.jade',
    'lib/client/templates/sidebar/user_panel.jade',
    'lib/client/templates/sidebar/side_search_form.jade',
    'lib/client/templates/sidebar/sidebar_menu.jade',
    'lib/client/auth/auth_layout.jade',
    'lib/client/auth/auth_form.jade',
    'lib/client/auth/auth_form.coffee',
    'lib/client/auth/templates/appAtInput.jade',
    'lib/client/auth/templates/appAtInput.coffee',
    'lib/client/auth/templates/appAtPwdLink.jade',
    'lib/client/auth/templates/appAtPwdLink.coffee',
    'lib/client/auth/templates/appAtPwdFormBtn.jade',
    'lib/client/auth/templates/appAtPwdFormBtn.coffee',
    'public/images/avatar.png'
  ], 'client');

  // server
  api.addFiles([

  ], 'server');


  // Last but not least.. (optional)
  api.export('App');

});




//Package.onTest(function (api) {
//  api.use([
//    'app:core',
//    'tinytest',
//    'test-helpers',
//    'templating',
//    'reactive-dict'
//  ], ['client']);
//});
