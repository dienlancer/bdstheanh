var vMemberTable           =   null;
var basicTable = function () {    
    var initMemberTable = function () {
        vMemberTable = $('#tbl-member').DataTable({
            columns: [           
                { data: "checked"            },                        
                { data: "fullname"      },
                { data: "email"      },
                { data: "mobilephone"      },
                { data: "address"         },                
            ]
        });        
    };        
    return {
        init: function () {
            if (!jQuery().dataTable){
                return;        
            }        
            initMemberTable();            
        }
    };
}();
