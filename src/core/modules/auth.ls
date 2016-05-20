wn = require('when')

class Authenticator

  _validateLogin: (email, pass) ->
    return

  login: (email, pass) ->
    wn.promise (resolve, reject) ~>
      validateStatus = @_validateLogin(email, pass)
      if validateStatus?
        resolve({success: false, msg: validateStatus})
        return
      engino.mongo.collection('users').find({email: email, password: pass}).toArray().then (data) ~>
        if data.length is 1
          userData = data.pop()
          token = Math.round(Math.random() * 10000000000)
          engino.mongo.collection('session').insert({userId: userData._id, token: token, createdAt: new Date()}).then (insertResult) ->
            delete userData.password
            delete userData._id
            resolve({success: true, token: token, user: userData})
        else
          resolve({success: false})
          return

  register: (email, password) ->
    wn.promise (resolve, reject) ~>
      engino.mongo.collection \users
      .find { email }
      .toArray().then (findExistingUser) ~>
        if findExistingUser.length > 0
          resolve { success: false, data: "Email already exists." }
          return
        engino.mongo.collection \users
        .insert { email, password }
        .then (insertData) ~>
          if insertData?
            resolve { success: true, data: insertData }
            return

  logout: (token) ->
    wn.promise (resolve, reject) ~>
      engino.mongo.collection('session').deleteOne {token: token}, (err, data) ->
        if err?
          return resolve({success: false})
        resolve({success: true})

  _validateRegister: (fullName, email, pass, confirmPass) ->
    if fullName.length < 3
      return "Fullname should be more than 3 chars"

  #   # http://stackoverflow.com/questions/46155/validate-email-address-in-javascript
    # emailRegex = /(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    # if not emailRegex.test(email)
    #   return "Email is not valid"

    # if pass isnt confirmPass
    #   return "Passwords doesn't match"

  #   # http://stackoverflow.com/questions/14850553/javascript-regex-for-password-containing-at-least-8-characters-1-number-1-upper case
    # passRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/
    # if not passRegex.test(pass)
    #   return "Password is not strong enough"
    return

  # register: (fullName, email, pass, confirmPass)->
  #   wn.promise (resolve, reject) ~>
  #     validateStatus = @_validateRegister(fullName, email, pass, confirmPass)
  #     if validateStatus?
  #       resolve({success: false, msg: validateStatus})
  #       return
  #     engino.mongo.collection("users").find({email: email}).toArray().then (findExistingUser) ~>
  #       if findExistingUser.length > 0
  #         resolve({success: false, msg: "Email already exist"})
  #         return
  #       engino.mongo.collection("users").insert({fullName: fullName, email: email, password: pass}).then (insertData) ~>
  #         @login email, pass
  #         .then (loginResult) ->
  #           resolve(loginResult)

  getUserByToken: (token) ->
    wn.promise (resolve, reject) ~>
      engino.mongo.collection('session').find({token: parseInt(token)}).toArray().then (data) ~>
        if data.length is 1
          userId = data.pop().userId
          @getUserById userId
          .then (data) ->
            if data.success
              resolve({success: true, user: data.user})
            else
              resolve({success: false})
        else
          resolve({success: false})

  getUserById: (id) ->
    wn.promise (resolve, reject) ~>
      engino.mongo.collection('users').find({_id: id}).toArray().then (data) ->
        if data.length is 1
          user = data.pop()
          data = {success: true, user: user}
          resolve(data)
        else
          resolve({success: false})

module.exports = wn.promise (resolve, reject) ->
  resolve new Authenticator