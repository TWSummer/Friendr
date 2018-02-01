import React from 'react';

class ProfileHeader extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.profile;
  }

  showEditForm(e) {
    this.setState({header: true});
  }

  update(field) {
    return (e) => {
      this.setState({[field]: e.target.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.updateProfile(this.state)
      .then(
        () => this.setState({header: false})
      );
  }

  render() {
    let profileHeaderFields;
    if (this.state.header) {
      profileHeaderFields = (
        <div
          className="profile-header-fields">
          <form onSubmit={this.handleSubmit.bind(this)}>
            <label htmlFor="name">First Name</label>
            <br/>
            <input
              type="text"
              id="name"
              placeholder="First Name"
              value={this.state.name}
              className="profile-header-input"
              onChange={this.update("name").bind(this)}
              />
            <br/>
            <label htmlFor="birthdate">Birthdate</label>
            <br/>
            <input
              id="birthdate"
              type="date"
              value={this.state.birthdate}
              className="profile-header-input"
              onChange={this.update("birthdate").bind(this)}
              />
            <br/>
            <input
              type="submit"
              className="profile-header-submit"
              value="Update" />
          </form>
        </div>
      );
    } else {
      profileHeaderFields = (
        <div
          className="profile-header-fields"
          onClick={this.showEditForm.bind(this)}>
          <div className="name-box">
            <h1>{this.props.profile.name}</h1>
            <i className="fas fa-pencil-alt"></i>
          </div>
          <h3>{this.props.profile.age}</h3>
        </div>
      );
    }
    return (
      <header className="profile-header">
        <main>
          <img
            className="profile-image-holder"
            src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
            alt="Profile image"/>
          {profileHeaderFields}
        </main>
      </header>
    );
  }
}

export default ProfileHeader;
