// wd create-entity create-office.js "Minister for X"
module.exports = (label) => {
  return {
    type: 'item',
    labels: {
      en: label,
    },
    descriptions: {
      en: 'government position in Greenland',
    },
    claims: {
      P31:   { value: 'Q294414' }, // instance of: public office
      P279:  { value: 'Q83307'  }, // subclas of: minister
      P1001: { value: 'Q223'    }, // jurisdiction: Greenland
      P361:  { value: 'Q10858355' } // part of: Cabinet
    }
  }
}
