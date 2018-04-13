$(function() {
    var cache_drug = {};
    var cache_se = {};
    var cache_iu = {};
    var cache_soc = {};
    var cache_reaction = {};
    $("#dname, #compare_dname, #compare_dname_2").autocomplete({
        minLength: 3,
        source: function(request, response) {
            predict(cache_drug, request, response, "/drug/suggest_drug_name");
        }
    });

    $("#se").autocomplete({
        minLength: 3,
        source: function(request, response) {
            predict(cache_se, request, response, "/drug/suggest_side_effect");
        }
    });

    $("#iu").autocomplete({
        minLength: 3,
        source: function(request, response) {
            predict(cache_iu, request, response, "/drug/suggest_indication_use");
        }
    });

    $("#soc").autocomplete({
        minLength: 3,
        source: function(request, response) {
            console.log(request);
            predict(cache_soc, request, response, "/fda/suggest_soc");
        }
    });

    $("#reaction_term").autocomplete({
        minLength: 3,
        source: function(request, response) {
            predict(cache_reaction, request, response, "/fda/suggest_reaction");
        }
    });


    function predict(cache, request, response, field) {
        var req = request.term;
        var term = req.substring(0, 3);

        if (term in cache) {
            if (req in cache) {
                response(cache[req]);
                return;
            } else {
                var length = req.length;

                var sliced;
                while (length > 3) {
                    sliced = req.substring(0, length - 1);

                    if (sliced in cache) {

                        cache[req] = $.grep(cache[sliced], function(n, i) {
                            return n.toUpperCase().includes(req.toUpperCase());
                        });

                        response(cache[req]);
                        return;
                        break;
                    }
                    length = length - 1;
                }
            }
        }
        if (field.localeCompare("/fda/suggest_soc")===0){
            console.log(request);
            var drug = $('#dname').val();
            request.term = request.term + "," + drug;
            console.log(request.term);
        }
        if (field.localeCompare("/fda/suggest_reaction")===0){
            console.log(request);
            var drug = $('#dname').val();
            var soc = $('#soc').val();
            request.term = request.term + "," + drug + "," + soc;
            console.log(request.term);
        }

            $.getJSON(field, request, function(data, status, xhr) {
                cache[term] = data;
                response(data);
            });
    }

    $("#df_show, #dt_show").datepicker({
        dateFormat: "dd-mm-yy",
        altFormat: "yymmdd",
        yearRange: "2014:2017",
        changeYear: true,
        changeMonth: true,
        defaultDate: "01-01-14"
    });
    $("#df_show").datepicker("option", "altField", "#df");
    $("#dt_show").datepicker("option", "altField", "#dt");

});
