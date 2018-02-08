import ViewProfile from './view_profile';
import { connect } from 'react-redux';
import { fetchProfile } from '../../actions/profile_actions';
import { sendMessage } from '../../actions/message_actions';

const mapStateToProps = (state, ownProps) => {
  let profile;
  if (state.entities.profiles) {
    profile = Object.values(state.entities.profiles)[0];
  }
  return ({
    profile,
    messageErrors: state.errors.message
  });
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return ({
    fetchProfile: () => dispatch(fetchProfile(ownProps.match.params.username)),
    sendMessage: (message) => dispatch(sendMessage(message))
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ViewProfile);
