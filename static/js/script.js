

document.getElementById("delete-kanji-form").addEventListener("submit", function (e) {
e.preventDefault();

const input = this.querySelector('input[name="kanji"]');
const kanji = input.value.trim();

if (kanji.length > 1){
    alert("El kanji debe ser un solo carácter.");
    return;
}

if (!kanji) {
    alert("Por favor, escribe un kanji para eliminar.");
    return;
}

fetch(`/eliminar?kanji=${encodeURIComponent(kanji)}`, {
    method: "DELETE",
})
    .then(response => {
    if (response.ok) {
        alert("Kanji eliminado correctamente.");
        input.value = "";
    } else {
        alert("Error al eliminar el kanji.");
    }
    })
    .catch(error => {
    console.error("Error:", error);
    alert("Ocurrió un error en la petición.");
    });
});

// Alerta Añadir

document.getElementById("add-kanji-form").addEventListener("submit", function (e) {
    e.preventDefault();

    const input = this.querySelector('input[name="kanji"]');
    const kanji = input.value.trim();


    if (kanji.length > 1) {
                alert("El kanji debe ser un solo carácter.");
                return;
        }

    if (!kanji) {
        alert("Por favor, escribe un kanji para añadir.");
        return;
    }

    const formData = new FormData(this);

    fetch("/add", {
        method: "POST",
        body: formData,
    })
        .then(response => {
            if (response.ok) {
                alert("Kanji añadido correctamente.");
                this.reset(); // Limpiar el formulario
            } else {
                alert("Error al añadir el kanji.");
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("Ocurrió un error en la petición.");
        });
});