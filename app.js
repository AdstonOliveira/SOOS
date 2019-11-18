const express = require('express');
const morgan = require('morgan');
const bodyParser = require('body-parser');
const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

const clienteRouter = require('./routes/clienteRouter');
const colaboradorRouter = require('./routes/colaboradorRouter');
const OSRouter = require('./routes/OSRouter');
const equipRouter = require('./routes/equipRouter');



app.set('view engine', 'ejs');
app.set('views', 'views');

app.use( express.static(__dirname + '/public') );



app.use(morgan('dev'));

app.use('/cliente', clienteRouter);
app.use('/colaborador', colaboradorRouter);
app.use('/os', OSRouter);
app.use('/equip', equipRouter);


app.get('/', (req, res, next) => {
    res.render('index', {
      titulo: 'SOOS - Sistema Online Ordem Serviço'
    });
});

app.use((req, res, next) => {
    res.sendStatus(404);
  });
  
  app.listen(3000);