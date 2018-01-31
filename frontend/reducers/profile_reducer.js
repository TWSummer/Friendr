import merge from 'lodash/merge';
import {RECEIVE_PROFILE} from '../actions/profile_actions';

const profileReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_PROFILE:
      return {[action.profile.user_id]: action.profile};
    default:
      return state;
  }
};

export default profileReducer;
