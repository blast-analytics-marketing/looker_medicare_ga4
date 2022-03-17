datagroup: bqml_datagroup {
  #retrain model every year
  sql_trigger: SELECT EXTRACT(year from CURRENT_DATE()) ;;
}
