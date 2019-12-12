f=()=>
{
    const { exec } = require('child_process');
    var i = 5;
    if (i > 0){
    if (require('fs').existsSync('Sully_5.js')){
    	var n = `Sully_${i - 1}.js`;
    	require('fs').writeFileSync(n,'f='+f.toString().replace(i, i - 1)+';f();\n');        
    } else {
    	var n = `Sully_${i}.js`;
		require('fs').writeFileSync(n,'f='+f.toString()+';f();\n');
    }
    i--;
    exec(`node ${n}`);
	}
};f();
