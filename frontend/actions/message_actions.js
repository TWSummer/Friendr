import * as APIUtil from '../util/message_util';

export const RECEIVE_MESSAGES = "RECEIVE_MESSAGES";
export const RECEIVE_MESSAGE = "RECEIVE_MESSAGE";
export const RECEIVE_MESSAGE_ERRORS = "RECEIVE_MESSAGE_ERRORS";

const receiveMessages = messages => ({
  type: RECEIVE_MESSAGES,
  messages
});

const receiveMessage = message => ({
  type: RECEIVE_MESSAGE,
  message
});

const receiveErrors = errors => ({
  type: RECEIVE_MESSAGE_ERRORS,
  errors
});

export const fetchMessages = () => dispatch => (
  APIUtil.fetchMessages()
    .then(
      messages => dispatch(receiveMessages(messages)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    )
);


export const sendMessage = formMessage => dispatch => (
  APIUtil.sendMessage(formMessage)
    .then(
      message => dispatch(receiveMessage(message)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    )
);
