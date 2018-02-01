import ViewProfile from './view_profile';
import { connect } from 'react-redux';
import { fetchProfile, updateProfile } from '../../actions/profile_actions';

const mapStateToProps = (state, ownProps) => {
  let profile;
  if (state.entities.profiles) {
    profile = Object.values(state.entities.profiles)[0];
  }
  return ({
    profile
  });
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return ({
    fetchProfile: () => dispatch(fetchProfile(ownProps.match.params.username)),
    updateProfile: (profile) => dispatch(updateProfile(profile))
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ViewProfile);
