

document.getElementById("delete-kanji-form").addEventListener("submit", function (e) {
e.preventDefault();

const input = this.querySelector('input[name="kanji"]');
const kanji = input.value.trim();

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