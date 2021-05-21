import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import '../tools/helper.dart';
import 'view.list.dart';
part 'model.g.dart';
part 'model.g.view.dart';
// Define the 'tableCategory' constant as SqfEntityTable for the category table.
const tableCategory = SqfEntityTable(
  tableName: 'category',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  modelName: null,
  fields: [
    SqfEntityField('name', DbType.text),
    SqfEntityField('isActive', DbType.bool, defaultValue: true),
  ]
);
// Define the 'tableProduct' constant as SqfEntityTable for the product table.
const tableProduct = SqfEntityTable(
  tableName: 'product',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  fields: [
    SqfEntityField('name', DbType.text),
    SqfEntityField('description', DbType.text),
    SqfEntityField('price', DbType.real, defaultValue: 0),
    SqfEntityField('isActive', DbType.bool, defaultValue: true),
    SqfEntityFieldRelationship(
        parentTable: tableCategory,
        deleteRule: DeleteRule.CASCADE,
        defaultValue: 0), // Relationship column for CategoryId of Product
   SqfEntityField('rownum', DbType.integer,
        sequencedBy:
           seqIdentity /*Example of linking a column to a sequence */),
    SqfEntityField('imageUrl', DbType.text)
]);
const tableTodo = SqfEntityTable(
  tableName: 'todos',
  primaryKeyName: 'id',
  useSoftDeleting: false,
  primaryKeyType: PrimaryKeyType.integer_unique,
  defaultJsonUrl:
      'https://jsonplaceholder.typicode.com/todos', // optional: to synchronize your table with json data from webUrl

  // declare fields
  fields: [
    SqfEntityField('userId', DbType.integer),
    SqfEntityField('title', DbType.text),
    SqfEntityField('completed', DbType.bool, defaultValue: false)
]);
const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
  // maxValue:  10000, /* optional. default is max int (9.223.372.036.854.775.807) */
  // modelName: 'SQEidentity', 
                      /* optional. SqfEntity will set it to sequenceName automatically when the modelName is null*/
  // cycle : false,   /* optional. default is false; */
  // minValue = 0;    /* optional. default is 0 */
  // incrementBy = 1; /* optional. default is 1 */
  // startWith = 0;   /* optional. default is 0 */
);
 @SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
    modelName: 'MyDbModel', // optional
    databaseName: 'sampleORM.db',
    password: null, // You can set a password if you want to use crypted database 
                   // (For more information: https://github.com/sqlcipher/sqlcipher)

    // put defined tables into the tables list.
    databaseTables: [tableCategory, tableProduct, tableTodo],
     // You can define tables to generate add/edit view forms if you want to use Form Generator property
    formTables: [tableProduct, tableCategory, tableTodo],
    // put defined sequences into the sequences list.
    sequences: [seqIdentity],
    bundledDatabasePath:
        null // 'assets/sample.db' // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
);