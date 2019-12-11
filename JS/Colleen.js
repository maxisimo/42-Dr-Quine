// Un commentaire
main = function() {
    // Un commentaire
    ft()
    console.log("// Un commentaire\n("+main.toString()+")()\n\nft = function() {\nreturn\n}");
}

ft = function() {
  return
}

// ou

// Un commentaire
(function main(){
    // Un commentaire
    ft()
    console.log("// Un commentaire\n("+main.toString()+")()\n\nfunction ft (){return ''}");
})()

function ft (){return ''}

// Mais je pense que les deux fonctionnent pareil et j'ai une préférence pour la première écriture
