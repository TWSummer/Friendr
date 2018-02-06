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
