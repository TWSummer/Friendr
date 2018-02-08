export const fetchMessages = () => (
  $.ajax({
    method: 'GET',
    url: `/api/messages`
  })
);

export const sendMessage = message => (
  $.ajax({
    method: 'POST',
    url: `/api/messages`,
    data: { message }
  })
);
