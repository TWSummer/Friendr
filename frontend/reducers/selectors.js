let sortByCompatibility = (a, b) => {
  return b.compatibility - a.compatibility;
};

let sortByDistance = (a, b) => {
  if (a.distance === null) {
    return 1;
  } else if (b.distance === null) {
    return -1;
  } else {
    return a.distance - b.distance;
  }
};

let sortByCreatedAt = (a, b) => {
  if (a.created_at < b.created_at) {
    return -1;
  } else {
    return 1;
  }
};

let addOrder = (conversations) => {
  let userIds = Object.keys(conversations);
  userIds = userIds.sort( (a, b) => {
    if (conversations[a][conversations[a].length - 1].created_at <
        conversations[b][conversations[b].length - 1].created_at) {
      return 1;
    } else {
      return -1;
    }
  });
  conversations.order = userIds;
};

export const resultsByCompatibility = (state) => {
  let results = state.entities.search.results;
  if (results) {
    results = results.slice(0);
    return results.sort(sortByCompatibility);
  } else {
    return [];
  }
};

export const resultsByDistance = (state) => {
  let results = state.entities.search.results;
  if (results) {
    results = results.slice(0);
    return results.sort(sortByDistance);
  } else {
    return [];
  }
};

export const messageConversations = (state) => {
  let conversations = {};
  let currentUserId = state.session.currentUser.id;
  let messages = state.entities.messages.slice(0);
  messages = messages.sort(sortByCreatedAt);
  messages.forEach( message => {
    if (message.sender_id === currentUserId) {
      if (conversations[message.recipient_id] === undefined) {
        conversations[message.recipient_id] = [message];
      } else {
        conversations[message.recipient_id].push(message);
      }
    } else {
      if (conversations[message.sender_id] === undefined) {
        conversations[message.sender_id] = [message];
      } else {
        conversations[message.sender_id].push(message);
      }
    }
  });
  addOrder(conversations);
  return conversations;
};
