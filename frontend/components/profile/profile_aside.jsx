import React from 'react';

class profileAside extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.profile;
  }

  componentWillReceiveProps(newProps) {
    if (this.props.profile.user_id !== newProps.profile.user_id) {
      this.setState({
        id: newProps.profile.id,
        user_id: newProps.profile.user_id,
        gender: newProps.profile.gender
      });
    }
  }

  setEdit(e) {
    this.setState({edit: true});
  }

  cancelEdit(e) {
    e.preventDefault();
    this.setState({edit: false, gender: this.props.profile.gender});
  }

  updateGender(e) {
    this.setState({gender: e.target.value});
  }

  handleSubmit(e) {
    this.props.updateProfile({
      id: this.state.id,
      user_id: this.state.user_id,
      gender: this.state.gender
    })
      .then(
        () => this.setState({edit: false})
      );
  }

  render() {
    let genderDisplayContents;
    if (this.state.edit) {
      genderDisplayContents = (
        <form>
          <select
            className="gender-select"
            value={this.state.gender}
            onChange={this.updateGender.bind(this)}>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
            <option value="Prefer Not to Say">Prefer Not to Say</option>
          </select>
          <br/>
          <button
            onClick={this.handleSubmit.bind(this)}
            className="submit-response-button"
            >Save</button>
          <button
            onClick={this.cancelEdit.bind(this)}
            className="cancel-response-button"
            >Cancel</button>
        </form>

      );
    } else {
      genderDisplayContents = (
        <div
          className="gender-display"
          onClick={this.setEdit.bind(this)}>
          {this.state.gender}
          <i className="fas fa-pencil-alt"></i>
        </div>
      );
    }
    return (
      <aside className="profile-aside">
        <b>Gender</b><br />
        {genderDisplayContents}
      </aside>
    );
  }
}

export default profileAside;
