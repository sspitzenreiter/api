var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var sha1 = require('js-sha1');

router.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});
/* GET home page. */
router.get('/', function(req, res, next) {
  var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password:'',
    database: 'polpos'
  })
  connection.connect();
  connection.query('select * from mahasiswa', function(err, result, field){
    if(err) throw err

    var datares = result;
    res.send(datares);
  });
  
  connection.end();
});

router.get('/cek', (req, res, next)=>{
  res.send('Sukses');
})

router.get('/form', function(req, res, next) {
  res.render('./form.html')
})

router.post('/submit',function(req,res,next){
  var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password:'',
    database: 'apidone'
  });
  connection.connect();
  console.log(req.body);
  var encode = "'"+req.body.email+"''"+req.body.nama+"'";
  var api_key = sha1(encode);
  var sql = "insert into data_client (email,company,nama,api_key) values ('"+req.body.email+"','"+req.body.company+"','"+req.body.nama+"','"+api_key+"')"

  connection.query(sql,function(err){
    if (err) throw err
    var data ={
      'key' : api_key
    }
      res.render('./apikey.html',data)
  })
  connection.end();

})

router.get('/cek', function(req, res, next) {
  var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password:'',
    database: 'polpos'
  });
  connection.connect();
  connection.query('select nilai,status_krs from mahasiswa where npm ="'+req.query.npm+'"', function(err, result, field){
    if(err) throw err

    var datares = result;
    //if(result[0].nilai)
    //res.send(result[0].status_krs);
    res.send(datares)
    console.log(JSON.stringify(datares));
  });
  connection.end();
})

router.get('/veriv', function(req, res, next) {
  var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password:'',
    database: 'apidone'
  });
  connection.connect();
  connection.query('select id from data_client where api_key ="'+req.query.api+'"', function(err, result, field){
    if(result.length>0){
      console.log(result);
      connection.query('select id_matkul,nilai from nilai where npm ="'+req.query.npm+'"', function(err2, result2, field){
        if(result2 != ""){

        var datares = result2;
        //if(result[0].nilai)
        //res.send(result[0].status_krs);
        res.send(datares);
        console.log(JSON.stringify(datares));
        connection.end();
        }else{
          var msg ={
            'status' : '0',
            'message':'Tidak Ada Mahasiswa Dengan NPM Berikut'
          }
          res.send(msg);
        }
      });
    }else{
      res.render('./apierr.html');
      
    }
  });
})
router.get('/matkul', function(req, res, next) {
  var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "apidone"
});
connection.connect();
connection.query('select id from data_client where api_key ="'+req.query.api+'"', function(err, result, field){
  if(result.length>0){
    console.log(result);
    connection.query('select id_matkul,nama_matkul from matakuliah where prodi ="'+req.query.prodi+'"', function(err2, result2, field){
      if(result2 != ""){

      var datares = result2;
      //if(result[0].nilai)
      //res.send(result[0].status_krs);
      res.send(datares);
      console.log(JSON.stringify(datares));
      connection.end();
      }else{
        var msg ={
          'status' : '0',
          'message':'Tidak Ada Matakuliah Dengan Kode Berikut'
        }
        res.send(msg);
      }
    });
  }else{
    res.render('./apierr.html');
    
  }
});
});
module.exports = router;
