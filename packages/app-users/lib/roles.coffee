###*
# Nostradamus roles
# @namespace Users.is
###

Users.is = {}

###*
# Check if a user is an admin
# @param {Object|string} userOrUserId - The user or their userId
###

Users.is.admin = (userOrUserId) ->
  #TODO: implement method

###*
# Check if a user owns a document
# @param {Object|string} userOrUserId - The user or their userId
# @param {Object} document - The document to check (post, comment, user object, etc.)
###

Users.is.owner = (userOrUserId, document) ->
  try
    user = Users.getUser userOrUserId
    if !!document.userId
# case 1: document is a post or a comment, use userId to check
      return user._id == document.userId
    else
# case 2: document is a user, use _id to check
      return user._id == document._id
  catch e
    return false
  # user not logged in
  return


Meteor.users.helpers
  isOwner: (document) ->
    Users.is.owner this, document