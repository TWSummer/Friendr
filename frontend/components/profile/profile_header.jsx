import React from 'react';
import ReactDOM from 'react-dom';

class ProfileHeader extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.profile;
    this.showUploadForm = this.showUploadForm.bind(this);
    this.uploadCallback = this.uploadCallback.bind(this);
    this.closeEditForm = this.closeEditForm.bind(this);
  }

  componentDidUpdate(prevProps, prevState) {
    if (this.state.header && !prevState.header) {
      const map = this.refs.map;
      const options = {
        center: this.setMapCenter(),
        zoom: 10
      };
      this.map = new google.maps.Map(map, options);
      const pos = new google.maps.LatLng(options.center.lat, options.center.lng);
      let marker = new google.maps.Marker({
        position: pos,
        map: this.map
      });
      this.listenForClick(marker);
    }
  }

  componentWillReceiveProps(newProps) {
    if (this.props.profile.user_id !== newProps.profile.user_id) {
      this.setState({
        id: newProps.profile.id,
        user_id: newProps.profile.user_id,
        name: newProps.profile.name,
        birthdate: newProps.profile.birthdate,
        latitude: newProps.profile.latitude,
        longitude: newProps.profile.longitude,
        primary_img_url: newProps.profile.primary_img_url
      });
    }
  }

  listenForClick(marker) {
    google.maps.event.addListener(this.map, 'click', (e) => {
      marker.setMap(null);
      marker = new google.maps.Marker({
          position: e.latLng,
          map: this.map
      });
      this.setState({
        latitude: e.latLng.lat(),
        longitude: e.latLng.lng()
      });
    });
  }

  showEditForm(e) {
    this.setState({header: true});
  }

  closeEditForm(e) {
    this.setState({
      name: this.props.profile.name,
      birthdate: this.props.profile.birthdate,
      latitude: this.props.profile.latitude,
      longitude: this.props.profile.longitude,
      showErrors: false,
      header: false
    });
  }

  update(field) {
    return (e) => {
      this.setState({[field]: e.target.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.updateProfile({
      id: this.state.id,
      user_id: this.state.user_id,
      name: this.state.name,
      birthdate: this.state.birthdate,
      latitude: this.state.latitude,
      longitude: this.state.longitude
    })
      .then(
        () => this.setState({header: false, showErrors: false}),
        () => this.setState({showErrors: true})
      );
  }

  editHeader() {
    let errorsField;
    if (this.state.showErrors) {
      errorsField = (
        <ul>
          {
            this.props.errors.map( (error, idx) => (
              <li className="profile-errors" key={idx}>{error}</li>
            ))
          }
        </ul>
      );
    }
    return (
      <div
        className="profile-header-fields expanded-header-color">
        {errorsField}
        <i
          className="fas fa-times"
          id="close-header-edit"
          onClick={this.closeEditForm}
          ></i>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <label htmlFor="name">First Name</label>
          <br/>
          <input
            type="text"
            id="name"
            placeholder="First Name"
            value={this.state.name}
            className="profile-header-input"
            autoFocus={true}
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
          <label htmlFor="map">Location</label>
          <br/>
          <div id='map' ref='map'/>
          <input
            type="submit"
            className="profile-header-submit"
            value="Update" />
        </form>
      </div>
    );
  }

  displayHeader() {
    return (
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

  setMapCenter() {
    let latitude = this.state.latitude;
    let longitude = this.state.longitude;
    if (!latitude || !longitude) {
      latitude = 37.7758;
      longitude = -122.435;
    }
    return ({
      lat: latitude,
      lng: longitude
    });
  }

  showUploadForm() {
    cloudinary.openUploadWidget(cloudinary_options, this.uploadCallback)
  }

  uploadCallback(errors, successDetails) {
    if (errors === null) {
      this.props.updateProfile({
        id: this.state.id,
        user_id: this.state.user_id,
        primary_img_url: successDetails[0].secure_url
      })
      .then(
        () => this.setState({
          header: false,
          showErrors: false,
          primary_img_url: successDetails[0].secure_url
        }),
        () => this.setState({showErrors: true})
      );
    }
  }

  render() {
    let profileHeaderFields;
    if (this.state.header) {
      profileHeaderFields = this.editHeader();
    } else {
      profileHeaderFields = this.displayHeader();
    }
    let expandHeader = "";
    if (this.state.header) {
      expandHeader = "expand-header";
    }
    const mapCenter = this.setMapCenter();
    return (
      <header className={`profile-header ${expandHeader}`}>
        <main>
          <img
            className="profile-image-holder"
            src={this.state.primary_img_url}
            alt="Profile image"/>
          <button
            className="upload-photo-button"
            onClick={this.showUploadForm}
            >Upload</button>
          {profileHeaderFields}
        </main>
      </header>
    );
  }
}

export default ProfileHeader;
