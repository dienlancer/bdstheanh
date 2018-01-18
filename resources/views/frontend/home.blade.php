@extends("frontend.master")
@section("content")
<?php 
$setting=getSettingSystem();
$name_nvkd_1=$setting['name_nvkd_1']['field_value'];
$name_nvkd_2=$setting['name_nvkd_2']['field_value'];
$name_nvkd_3=$setting['name_nvkd_3']['field_value'];
$name_nvkd_4=$setting['name_nvkd_4']['field_value'];

$skype_nvkd_1=$setting['skype_nvkd_1']['field_value'];
$skype_nvkd_2=$setting['skype_nvkd_2']['field_value'];
$skype_nvkd_3=$setting['skype_nvkd_3']['field_value'];
$skype_nvkd_4=$setting['skype_nvkd_4']['field_value'];

$email_nvkd_1=$setting['email_nvkd_1']['field_value'];
$email_nvkd_2=$setting['email_nvkd_2']['field_value'];
$email_nvkd_3=$setting['email_nvkd_3']['field_value'];
$email_nvkd_4=$setting['email_nvkd_4']['field_value'];

$tel_nvkd_1=$setting['tel_nvkd_1']['field_value'];
$tel_nvkd_2=$setting['tel_nvkd_2']['field_value'];
$tel_nvkd_3=$setting['tel_nvkd_3']['field_value'];
$tel_nvkd_4=$setting['tel_nvkd_4']['field_value'];
?>
  
@endsection()               