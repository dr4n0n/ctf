const express = require('express');
const app = express();
const path = require('path');
const ejs = require('ejs');
const db = require('./db');

app.set('view engine', 'ejs');
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.urlencoded({ extended: true }));

let mode = 'nice';

const message_template = "<%= name %> is on the <%= result %> list!"

app.get('/', (req, res) => {
    const theme = mode === 'nice' ? { title: 'Nice List Search', color: '#DFFFD6' } : { title: 'Naughty List Search', color: '#2E2E2E' };
    res.render('index', { theme, result: undefined });
});

app.post('/search', (req, res) => {
    const name = req.body.name?.split(',');
    if (name == undefined || name.length < 2) {
        res.render('index', {
            theme: mode === 'nice' ? { title: 'Nice List Search', color: '#DFFFD6' } : { title: 'Naughty List Search', color: '#2E2E2E' },
            result: true,
            message: ejs.render(`${name} is invalid, format must be first name, last name.`),
        });
        return
    }
    const first_name = name[0].toLowerCase().trim()
    const last_name = name[1].toLowerCase().trim()
    let status = db.checkNiceStatus(first_name, last_name)
    if (!status.found) {
        status = mode == 'nice' ? db.addToList(first_name,last_name,true, false) : db.addToList(first_name,last_name,false, true)
    }
    const result = mode == "nice" ? status.nice : status.naughty
    res.render('index', {
        theme: mode === 'nice' ? { title: 'Nice List Search', color: '#DFFFD6' } : { title: 'Naughty List Search', color: '#2E2E2E' },
        result: result,
        message: ejs.render(message_template, {
            result: mode,
            name: first_name
        }),
    });
});

app.get('/toggle', (req, res) => {
    mode = mode === 'nice' ? 'naughty' : 'nice';
    res.redirect('/');
});

app.listen(8080, () => {
    console.log('Server running at http://localhost:8080');
});
