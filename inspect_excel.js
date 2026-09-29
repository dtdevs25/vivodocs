const xlsx = require('./backend/node_modules/xlsx');
const path = require('path');

const filePath = path.join(__dirname, 'CONTROLE PGR_2026_V4.xlsx');
const workbook = xlsx.readFile(filePath);

workbook.SheetNames.forEach(sheetName => {
  console.log(`\nSheet: ${sheetName}`);
  const sheet = workbook.Sheets[sheetName];
  const data = xlsx.utils.sheet_to_json(sheet, { header: 1 });
  if (data.length > 0) {
    console.log('Headers:', data[0]);
    console.log('First row:', data[1]);
  }
});
