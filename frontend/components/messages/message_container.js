import MessageIndex from './message_index';
import { connect } from 'react-redux';
import { fetchMessages, sendMessage } from '../../actions/message_actions';
import { messageConversations } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => {

  return ({
    session: state.session,
    messages: messageConversations(state),
    errors: state.errors.message
  });
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return ({
    fetchMessages: () => dispatch(fetchMessages()),
    sendMessage: message => dispatch(sendMessage(message))
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MessageIndex);
