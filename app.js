const express = require('express');
const morgan = require('morgan');
const bodyParser = require('body-parser');

const clienteRouter = require('./routes/clienteRouter');
const app = express();

app.set('view engine', 'ejs');
app.set('views', 'views');

app.use(express.static(__dirname + '/public'));

app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: false }));


app.use('/cliente', clienteRouter);

app.get('/', (req, res, next) => {
    res.render('index', {
      titulo: 'SOOS - Sistema Online Ordem Serviço'
    });
});

app.use((req, res, next) => {
    res.sendStatus(404);
  });
  
  app.listen(3000);