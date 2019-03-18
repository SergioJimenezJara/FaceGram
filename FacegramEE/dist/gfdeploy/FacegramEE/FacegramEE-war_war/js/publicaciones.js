

var firebase = require("firebase");

var jsdom = require("jsdom");
var JSDOM = jsdom.JSDOM;

// Initialize Firebase
var config = {
    apiKey: "AIzaSyAuc4-xI2ewgR-r-xXIeOWkVP39WHK-ywU",
    authDomain: "proyectfb.firebaseapp.com",
    databaseURL: "https://proyectfb.firebaseio.com",
    projectId: "proyectfb",
    storageBucket: "proyectfb.appspot.com",
    messagingSenderId: "454206412620"
};
firebase.initializeApp(config);

// Get elements
//var fileButton = document.getElementById('fileButton');
global.document = new JSDOM("http://localhost:8080/FacegramEE-war/uploadFirebaseHype.html").window.document.getElementById('fileButton');

// Listen for file selection
fileButton.addEventlistener('change', function (e) {

    // Get file
    var file = e.target.files[0];

    //Create a storage ref
    firebase.storage.ref('images/' + file.name);

    // Upload file
    storageRef.put(file);

});

