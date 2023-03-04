**free

ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-s outfile sqltype(xml_clob_file);
dcl-s path varchar(100) inz('jsonfile.xml');
dcl-s jsonstring varchar(1000);

// Options for SQL precompiler.
exec sql
    set option commit = *none;

clear outfile;
outfile_name = %trim(path);
outfile_nl = %len(%trim(path));
outfile_fo = sqfcrt;

exec sql
    select
       json_object ('Customers' value json_arrayagg (
       json_object ('Customer_ID' value customer_id,
                    'Customer_Description' value customer_description)))
    into :jsonstring
    from clv1.customers;

snd-msg jsonstring;

*inlr = '1';
return;