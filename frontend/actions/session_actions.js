import * as APIUtil from '../util/session_api_util';

export const RECEIVE_USER = 'RECEIVE_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';
export const CLEAR_ERRORS = 'CLEAR_ERRORS';

const receiveUser = user => ({
  type: RECEIVE_USER,
  user
});

const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const clearErrors = () => ({
  type: CLEAR_ERRORS
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

export const createDemo = () => dispatch => (
  APIUtil.createDemo()
    .then(
      user => dispatch(receiveUser(user)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    )
);
