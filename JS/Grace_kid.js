// Un commentaire
main = function(){
    const fs = require('fs');
    fs.writeFile('Grace_kid.js', "// Un commentaire\n(" + main.toString() + ")()", () => {})
}
