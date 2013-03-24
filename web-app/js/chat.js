$(function () {
    "use strict";

    var header = $('#header');
    var content = $('#content');
    var input = $('#input');
    var status = $('#status');
    var myName = user;
    var author = user;
    var logged = false;
    var socket = $.atmosphere;
    var subSocket;
    var transport = 'websocket';
    var chatUrl = 'http://'+document.location.hostname+':'+document.location.port+'/test-datasource/atmosphere/chat';

    <!-- The following code is just here for demonstration purpose and not required -->
    <!-- Used to demonstrate the request.onTransportFailure callback. Not mandatory -->
    var sseSupported = false;

    var transports = new Array();
    transports[0] = "websocket";
    transports[1] = "sse";
    transports[2] = "jsonp";
    transports[3] = "long-polling";
    transports[4] = "streaming";
    transports[5] = "ajax";

    $.each(transports, function (index, transport) {
        var req = new $.atmosphere.AtmosphereRequest();

        req.url = chatUrl;
        req.contentType = "application/json";
        req.transport = transport;
        req.headers = { "negotiating" : "true" };



        req.onReconnect = function(request) {
            request.close();
        }

        socket.subscribe(req)
    });
    <!-- Below is code that can be re-used -->

    // We are now ready to cut the request
    var request = { url: chatUrl,
        contentType : "application/json",
        logLevel : 'debug',
        shared : 'true',
        transport : transport ,
        fallbackTransport: 'long-polling'};


    request.onOpen = function(response) {
        content.html($('<p>', { text: 'Atmosphere connected using ' + response.transport }));
        input.removeAttr('disabled').focus();
//        status.text('Choose name:');
        transport = response.transport;

        if (response.transport == "local") {
            subSocket.pushLocal("Name?");
        }
    };

    <!-- You can share messages between window/tabs.   -->
    request.onLocalMessage = function(message) {
        if (transport != 'local') {
            header.append($('<h4>', { text: 'A new tab/window has been opened'}).css('color', 'green'));
            if (myName) {
                subSocket.pushLocal(myName);
            }
        } else {
            if (!myName) {
                myName = message;
                logged = true;
                status.text(message + ': ').css('color', 'blue');
                input.removeAttr('disabled').focus();
            }
        }
    };

    <!-- For demonstration of how you can customize the fallbackTransport using the onTransportFailure function -->
    request.onTransportFailure = function(errorMsg, request) {
        jQuery.atmosphere.info(errorMsg);
        if (window.EventSource) {
            request.fallbackTransport = "sse";
            transport = "see";
        }
        header.html($('<h3>', { text: 'Atmosphere Chat. Default transport is WebSocket, fallback is ' + request.fallbackTransport }));
    };

    request.onReconnect = function (request, response) {
        socket.info("Reconnecting")
    };

    request.onMessage = function (response) {

        // We need to be logged first.
        if (!myName) return;

        var message = response.responseBody;
        //console.log('response is ')
        //console.log(response)
        //console.log('message is ' + message)
        try {
            var json = jQuery.parseJSON(message);
        } catch (e) {
            //console.log('This doesn\'t look like a valid JSON: ', message);
            return;
        }

        if (!logged) {
            logged = true;
            status.text(myName + ': ').css('color', 'blue');
            input.removeAttr('disabled').focus();
        } else {
            input.removeAttr('disabled');

            var me = json.author == author;
            var date = typeof(json.time) == 'string' ? parseInt(json.time) : json.time;
            addMessage(json.author, json.text, me ? 'blue' : 'black', new Date(date));
        }
    };

    request.onClose = function(response) {
        logged = false;
    }

    request.onError = function(response) {
        content.html($('<p>', { text: 'Sorry, but there\'s some problem with your '
            + 'socket or the server is down' }));
    };

    subSocket = socket.subscribe(request);

    input.keydown(function(e) {
        if (e.keyCode === 13) {
            var msg = $(this).val();

            // First message is always the author's name
            subSocket.push(jQuery.stringifyJSON({ author: author, message: msg }));
            $(this).val('');

            //input.attr('disabled', 'disabled');
            if (myName === false) {
                myName = author;
            }
        }
    });

    function addMessage(author, message, color, datetime) {
        content.append('<p><span style="color:' + color + '">' + author + '</span> @ ' +
            + (datetime.getHours() < 10 ? '0' + datetime.getHours() : datetime.getHours()) + ':'
            + (datetime.getMinutes() < 10 ? '0' + datetime.getMinutes() : datetime.getMinutes())
            + ': ' + message + '</p>');
    }
});

