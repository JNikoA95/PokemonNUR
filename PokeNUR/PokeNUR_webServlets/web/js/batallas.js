//SCRIPT FIDES
var operacion = 'A';
var ID;
var permiso;
$(document).ready(function() {
    $.getScript("js/nav-menu.js", function() {
    $("body").addClass("loading");
    $.ajax({
        url: "batallas",
        type: "GET",
        async: false,
        success: function(data) {
            var result = typeof (data) == "string" ? JSON.parse(data) : data;
            localStorage.setItem("batallaslist", JSON.stringify(result));
        }
    });

    var elementos = JSON.parse(localStorage.getItem("batallaslist"));
    permiso = getPermiso(ID);
    if(permiso.binsert==false){
        $(".btnNew").remove();
    }
    var html = '<tbody>';
    for (var k in elementos) {
        var obj = elementos[k];
        html =
                '<tr class="item" id="row-' + obj.codigo_id + '">' +
                '<td id="lb_jugador1_id">' + obj.jugador1_id + '</td>' +
                '<td id="lb_jugador2_id">' + obj.jugador2_id + '</td>' +
                '<td>';
    if (permiso.bupdate == true) {
        html+= '<a class="mod" data-id="' + obj.codigo_id + '">Modificar</a>';
    }
    if (permiso.bdelete == true) {
        html += '<a class="del" data-id="' + obj.codigo_id + '">Eliminar</a>';
    }
        html += '</td></tr>';
        $("#table_id").append(html);
    }
$('#table_id').append('</tbody>');
$('#table_id').DataTable( {
    language: {
        url: 'js/datatable_es.json'
    }
} );
$("body").removeClass("loading"); 
   
    $(".btnNew").on("click", function() {
        operacion = 'A';
        $("#container").slideUp(300, function() {
            $("#container").addClass("hidden");
            $("#form").removeClass("hidden");            
            $("#form").slideDown();            
        });
        $('#val-form').bootstrapValidator('resetForm',true);
        $("#codigo_id").val('0');
        $("#jugador1_id").val('');
        $("#jugador2_id").val('');
    });

    $(".btnBack").on("click", function() {
        if($('#form').attr('class')=='hidden'){
        parent.history.back();
        }else{
            $("#form").slideUp(300, function() {
            $("#form").addClass("hidden");
            $("#container").removeClass("hidden");
            $("#container").slideDown();
        });
        }
    });

    $(".btnCancel").on("click", function() {
        $("#form").slideUp(300, function() {
            $("#form").addClass("hidden");
            $("#container").removeClass("hidden");   
            $("#container").slideDown();
        });
    });
});

$(document).on("click", ".mod", function() {
    operacion = 'M';
    $("#container").slideUp(300, function() {
        $("#container").addClass("hidden");
        $("#form").removeClass("hidden");
        $("#form").slideDown();        
    });
    var tuplas = JSON.parse(localStorage.getItem("batallaslist"));
    for (var k in tuplas) {
        var obj = tuplas[k];
        if ($(this).data('id') == obj.codigo_id) {
        $("#codigo_id").val(obj.codigo_id);
        $("#jugador1_id").val(obj.jugador1_id);
        $("#jugador2_id").val(obj.jugador2_id);
    }
    }
});


$(document).on("click", ".del", function() {
    var llave = $(this).data('id');
        swal({
            title: "Esta seguro?",
            text: "Se eliminará el registro!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Si, eliminar!",
            cancelButtonText: "No, cancelar!",
            closeOnConfirm: false,
            closeOnCancel: false
        },
        function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: 'batallas',
                    data: {del: llave},
                    beforeSend: function (data) {
                        $("body").addClass("loading");
                    },
                    success: function (data) {
                        $("body").find("#row-" + llave).remove();
                        $(".messages").html("<div class='alert alert-danger alert-dismissable'>" +
                                "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>" +
                                "<strong>Atenci&oacute;n!</strong> Se elimin&oacute; un elemento</div>");
                        swal("Eliminado!", "El registro ha sido eliminado.", "success");
                    },
                    complete: function (data) {
                        $("body").removeClass("loading");
                    }
                });
            } else {
                swal("Cancelado", "No se realizo ninguna operacion", "error");
            }
        });
});
});
 function save() {
        var obj = JSON.stringify({
            codigo_id: $("#codigo_id").val(),
            jugador1_id: $("#jugador1_id").val(),
            jugador2_id: $("#jugador2_id").val()        });

        $.post('batallas', {make: obj}, function(responseText) {
            if (responseText != -1) {
                var item = JSON.parse(obj);
                var html =
                        //'<img width="" src="images/' + producto.image + '" alt="' + producto.nombre + '">' +
                        '<td id="lb_jugador1_id">' + item.jugador1_id + '</td>' +
                        '<td id="lb_jugador2_id">' + item.jugador2_id + '</td>' +
                        '<td>';
                if (permiso.bupdate == true) {
                    html += '<a class="mod" data-id="' + responseText + '">Modificar</a>';
                }
                if (permiso.bdelete == true) {
                    html += '<a class="del" data-id="' + responseText + '">Eliminar</a>';
                }
                html += '</td>';

                if (operacion == 'A') {
                    item.codigo_id=responseText;
                    html = '<tr class="item" id="row-' + responseText + '">' + html + '</tr>';
                    $("#table_id").append(html);
                    $(".messages").html("<div class='alert alert-success alert-dismissable'>" +
                            "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>" +
                            "<strong>Atenci&oacute;n!</strong> Se adicion&oacute; un elemento</div>");
                    var elementos = JSON.parse(localStorage.getItem("batallaslist"));
                    elementos.push(item);
                    localStorage.setItem("batallaslist", JSON.stringify(elementos));                    
                } else {
                    $("#table_id").find("#row-" + item.codigo_id).html(html);
                    $(".messages").html("<div class='alert alert-info alert-dismissable'>" +
                            "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>" +
                            "<strong>Atenci&oacute;n!</strong> Se modific&oacute; un elemento</div>");                    
                }
            }
        });
        $("#form").slideUp(300, function() {
            $("#form").addClass("hidden");
            $("#container").slideDown();            
            $("#container").removeClass("hidden");   
        });
    };
