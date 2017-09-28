//$("#main-menu").html('HOLAAAA');

$.ajax({
    url: "login",
    type: "GET",
    async: false,
    success: function(data) {
        var result = typeof (data) == "string" ? JSON.parse(data) : data;
        localStorage.setItem("menulist", JSON.stringify(result));
    }
});

//Menú para Desktop y tablets
var lista_menu = JSON.parse(localStorage.getItem("menulist"));
var menu = '<ul id="main-menu" class="nav nav-tabs pull-right"><li><a href="brief.html">Principal</a></li>';
for (var k in lista_menu) {
    var obj = lista_menu[k];
    if (obj.sitio_id === 100) {
        menu += '<li><a href="empleados.html" class="dropdown-toggle" data-toggle="dropdown">Personas</a><ul class="dropdown-menu">' +
                '<li><a href="empleados.html">Empleados</a></li>' +
                '<li><a href="equipos.html">Equipos</a></li></ul></li>'
    }
    // if (obj.sitio_id > 100 && obj.sitio_id < 200) {
    //     menu += '<li><a href="'+obj.sitio_id+'.html">'+obj.sitio_id+'</a></li>'
    // }
    if (obj.sitio_id == 200) {
        menu += '<li><a href="trabajos.html" class="dropdown-toggle" data-toggle="dropdown">Fiscalizacion</a><ul class="dropdown-menu">' +
                '<li><a href="servicios.html">Servicios</a></li>' +
                //'<li><a href="formularios.html">Formularios</a></li>' +
                '<li><a href="horarios.html">Horarios</a></li>' +
                '<li><a href="trabajos.html">Trabajos</a></li></ul></li>'
    }
    if (obj.sitio_id == 300) {
        menu += '<li><a href="usuarios.html" class="dropdown-toggle" data-toggle="dropdown">Seguridad</a><ul class="dropdown-menu">' +
                '<li><a href="roles.html">Roles y Permisos</a></li>' +
                '<li><a href="usuarios.html">Usuarios</a></li></ul></li>'
    }
    if (obj.sitio_id == 400) {
        menu += '<li><a href="zonas.html" class="dropdown-toggle" data-toggle="dropdown">Administracion</a><ul class="dropdown-menu">' +
                '<li><a href="zonas.html">Parametros Zonas</a></li>' +
                '<li><a href="tipozonas.html">Parametros Tipos de Zona</a></li></ul></li>'
    }
}
menu += '<li><a id="logout" href="login?logout=true">Cerrar Sesion</a></li>' +
        '</ul>';

//Menú para mobile
var menu_mobile = '<ul id="main-menu" class="nav text-center"><li><a href="brief.html">Principal</a></li>';
for (var k in lista_menu) {
    var obj = lista_menu[k];
    if (obj.sitio_id === 100) {
        menu_mobile += '<li><a href="#" data-toggle="collapse" data-target="#personas">Personas</a><ul id="personas" class="collapse">' +
                '<li><a href="empleados.html">Empleados</a></li>' +
                '<li><a href="equipos.html">Equipos</a></li></ul></li>'
    }
    // if (obj.sitio_id > 100 && obj.sitio_id < 200) {
    //     menu += '<li><a href="'+obj.sitio_id+'.html">'+obj.sitio_id+'</a></li>'
    // }
    if (obj.sitio_id == 200) {
        menu_mobile += '<li><a href="#" data-toggle="collapse" data-target="#trabajos">Fiscalizacion</a><ul id="trabajos" class="collapse">' +
                '<li><a href="servicios.html">Servicios</a></li>' +
                '<li><a href="formularios.html">Formularios</a></li>' +
                '<li><a href="horarios.html">Horarios</a></li>' +
                '<li><a href="trabajos.html">Trabajos</a></li></ul></li>'
    }
    if (obj.sitio_id == 300) {
        menu_mobile += '<li><a href="#" data-toggle="collapse" data-target="#usuarios">Seguridad</a><ul id="usuarios" class="collapse">' +
                '<li><a href="roles.html">Roles y Permisos</a></li>' +
                '<li><a href="usuarios.html">Usuarios</a></li>' +
                '<li><a href="horarios.html">Horarios</a></li></ul></li>'
    }
    if (obj.sitio_id == 400) {
        menu_mobile += '<li><a href="#" data-toggle="collapse" data-target="#zonas">Administracion</a><ul id="zonas" class="collapse">' +
                '<li><a href="zonas.html">Parametros Zonas</a></li>' +
                '<li><a href="tipozonas.html">Parametros Tipos de Zona</a></li></ul></li>'
    }
}
menu_mobile += '<li><a id="logout" href="login?logout=true">Cerrar Sesion</a></li>' +
        '</ul>';

// Asignación de Menú
$("#large").html(menu);
$("#mobile").html(menu_mobile);

function getPermiso(id) {
    for (var k in lista_menu) {
        var obj = lista_menu[k];
        if (id == obj.sitio_id) {
            return obj;
        }
    }
}

function buscar(json, id) {
//    alert(json);
//    alert(id);
    for (var k in json) {
        var obj = json[k];
        if (id == obj.codigo_id) {
            if(obj.snombre==null){
                if(obj.scuenta!=null){
                    return obj.scuenta;
                }
                if(obj.subicacion!=null){
                    return obj.subicacion;
                }
                return obj.stipo;
            }
            return obj.snombre;
        }
    }
}