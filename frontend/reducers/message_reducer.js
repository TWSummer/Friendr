import merge from 'lodash/merge';
import { RECEIVE_MESSAGE, RECEIVE_MESSAGES } from '../actions/message_actions';

const messageReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_MESSAGES:
      return {messages: action.messages};
    case RECEIVE_MESSAGE:
      return merge({}, {messages: state.messages.push(action.message)});
    default:
      return state;
  }
};

export default messageReducer;
