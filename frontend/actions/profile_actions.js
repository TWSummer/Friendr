import * as APIUtil from '../util/profile_util';

export const RECEIVE_PROFILE = 'RECEIVE_PROFILE';
export const RECEIVE_PROFILE_ERRORS = 'RECEIVE_PROFILE_ERRORS';

const receiveProfile = profile => ({
  type: RECEIVE_PROFILE,
  profile
});

const receiveErrors = errors => ({
  type: RECEIVE_PROFILE_ERRORS,
  errors
});

export const fetchProfile = username => dispatch => (
  APIUtil.fetchProfile(username)
    .then(
      profile => dispatch(receiveProfile(profile)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    )
);


export const updateProfile = formProfile => dispatch => (
  APIUtil.updateProfile(formProfile)
    .then(
      profile => dispatch(receiveProfile(profile)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    )
);
