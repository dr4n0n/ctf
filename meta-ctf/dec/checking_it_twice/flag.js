const fs = require('fs');
const process = require('process');

function readFlag() {
  try {
    const data = fs.readFileSync('flag.txt', 'utf8');
    return data;
  } catch (error) {
    process.exit(1);
  }
}

function deleteFlag() {
    try {
      fs.unlinkSync('flag.txt');
      console.log(`File flag.txt deleted successfully`);
      return true;
    } catch (error) {
        process.exit(1);
    }
  }

module.exports = {
    readFlag,
    deleteFlag,
  };