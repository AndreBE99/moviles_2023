void main(List<String> args) {
  var datos = {
    "usuario":"Juan",
    "pass":"1234abc"
  };

  if(datos["usuario"] == "Juan" && datos["pass"] == "1234abc") {
    print("Acceso autorizado");
  } else {
    print("Acceso no autorizado");
  }
}