export const fetchSearch = () => (
  $.ajax({
    method: 'GET',
    url: `/api/friend_searches`
  })
);

export const updateSearch = search => (
  $.ajax({
    method: 'PATCH',
    url: `/api/friend_searches/${search.id}`,
    data: { search }
  })
);
