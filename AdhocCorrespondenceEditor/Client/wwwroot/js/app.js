
async function OpenSample(previewURL, soapRequest, clientId, clientSecret){
    var authorizationBasic = window.btoa(clientId + ':' + clientSecret);
    var request = new XMLHttpRequest();
    request.open('POST', previewURL, true);
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    request.setRequestHeader('Authorization', 'Basic ' + authorizationBasic);
    request.setRequestHeader('Accept', 'application/json');
    request.send(soapRequest);
    request.responseType = "blob";
    request.onreadystatechange = function () {
        if (request.readyState === 4) {
            var file = new Blob([request.response], { type: 'application/pdf' });
            var fileURL = (window.URL ? URL : webkitURL).createObjectURL(file);;

            if (file.size > 26) {
                if (window.navigator && window.navigator.msSaveOrOpenBlob) {
                    window.navigator.msSaveOrOpenBlob(file);
                }
                else {
                    var objectUrl = (window.URL ? URL : webkitURL).createObjectURL(file);
                    window.open(objectUrl);
                }
            }
            else {
                error = "We’re sorry, an error occurred while getting the sample of the letter.";
            }
        }
    };
}

async function OpenXML(XMLString,HeaderString) {

    var formatedOutputXML = XMLString.replace(/undefined/g, "");

var params = 'scrollbars=yes,resizable=yes,status=no,location=no,toolbar=no,menubar=no,width=800,height=800,left=200,top=100';
var OutputXMLWindow = window.open('', 'Source Data', params);
    OutputXMLWindow.document.write("<html><head><title>" + HeaderString + "</title></head><body><textarea id=\"xmlData\" style=\"border:none;height:100%;width:100%;\" readonly>" + "<?xml version=\"1.0\" encoding=\"utf-8\" ?>" + formatedOutputXML + "</textarea></body></html>");
OutputXMLWindow.document.close();
}


