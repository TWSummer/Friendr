import Question from './question';
import { connect } from 'react-redux';
import { fetchProfile, updateProfile } from '../../actions/profile_actions';

const mapStateToProps = (state, ownProps) => {

  return ({
    session: state.session
  });
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return ({

  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Question);
