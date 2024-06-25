window.addEventListener('message', function(event) {
    if (event.data.action === 'displayData') {
        const data = event.data.data;
        const contentDiv = document.getElementById('content');
        contentDiv.innerHTML = '';

        for (const key in data) {
            if (data.hasOwnProperty(key)) {
                const value = data[key];
                const p = document.createElement('p');
                p.textContent = `${key}: ${value}`;
                contentDiv.appendChild(p);
            }
        }
    }
});

function closeUI() {
    fetch('https://cc-civilian-lookup/close', {
        method: 'POST'
    }).then(resp => resp.json()).then(resp => {
        console.log('UI closed');
    });
}
