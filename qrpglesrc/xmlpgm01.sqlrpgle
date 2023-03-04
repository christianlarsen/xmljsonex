**free

ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-s outfile sqltype(xml_clob_file);
dcl-s path varchar(100) inz('xmlfile.xml');

// Options for SQL precompiler.
exec sql
    set option commit = *none;

clear outfile;
outfile_name = %trim(path);
outfile_nl = %len(%trim(path));
outfile_fo = sqfcrt;

exec sql
    values (
       select xmlgroup(
          rtrim(customer_id) as "Customer_ID",
          rtrim(customer_description) as "Customer_Description"
          option row "Customer" root "Customers" as attributes)
          from clv1.customers
    ) into :outfile;

*inlr = '1';
return;