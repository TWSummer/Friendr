import * as APIUtil from '../util/session_api_util';

export const RECEIVE_USER = 'RECEIVE_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveUser = user => ({
  type: RECEIVE_USER,
  user
});

const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const signup = formUser => dispatch => (
  APIUtil.signup(formUser)
    .then(
      user => dispatch(receiveUser(user)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    )
);

export const login = formUser => dispatch => (
  APIUtil.login(formUser)
    .then(
      user => dispatch(receiveUser(user)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    )
);

export const logout = () => dispatch => (
  APIUtil.logout()
    .then(user => dispatch(receiveUser(null)))
);
