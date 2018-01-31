export const fetchProfile = username => (
  $.ajax({
    method: 'GET',
    url: `/api/users/${username}`
  })
);

export const updateProfile = profile => (
  $.ajax({
    method: 'POST',
    url: `/api/profiles/${profile.id}`,
    data: profile
  })
);
